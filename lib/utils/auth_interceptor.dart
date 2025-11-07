import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/auth_response_model.dart';
import 'package:ecommerce_app/utils/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final tokens = await SecureStorage.getTokens();
    if (tokens['accessToken'] != null) {
      options.headers['Authorization'] = 'Bearer ${tokens['accessToken']}';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // ⚠️ Jangan panggil super.onError(), biar kita kontrol penuh
    if (err.response?.statusCode == 401) {
      final tokens = await SecureStorage.getTokens();
      final refreshToken = tokens['refreshToken'];

      if (refreshToken == null) {
        return handler.next(err);
      }

      try {
        final response = await dio.post(
          'https://dummyjson.com/auth/refresh',
          data: {'refreshToken': refreshToken, 'expiresInMins': 30},
        );

        final authResponse = AuthResponseModel.fromJson(response.data);
        await SecureStorage.saveTokens(
          accessToken: authResponse.accessToken,
          refreshToken: authResponse.refreshToken,
        );

        // Retry original request with new token
        final clonedRequest = await _retryRequest(
          err.requestOptions,
          authResponse.accessToken,
        );
        return handler.resolve(clonedRequest);
      } catch (e) {
        await SecureStorage.clear();
        return handler.next(err);
      }
    }

    // Kalau bukan 401, teruskan error biasa
    return handler.next(err);
  }

  Future<Response<dynamic>> _retryRequest(
    RequestOptions requestOptions,
    String newAccessToken,
  ) async {
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $newAccessToken',
      },
    );

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
