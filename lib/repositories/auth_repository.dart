import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/auth_response_model.dart';
import 'package:ecommerce_app/utils/auth_interceptor.dart';
import 'package:ecommerce_app/utils/secure_storage.dart';

class AuthRepository implements BaseAuthRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

  AuthRepository() {
    _dio.interceptors.add(AuthInterceptor(_dio));
  }

  @override
  Future<AuthResponseModel> login(String username, String password) async {
    final response = await _dio.post(
      '/auth/login',
      data: {'username': username, 'password': password},
    );
    final auth = AuthResponseModel.fromJson(response.data);
    await SecureStorage.saveTokens(
      accessToken: auth.accessToken,
      refreshToken: auth.refreshToken,
    );
    return auth;
  }

  @override
  Future<void> logout() async {
    await SecureStorage.clear();
  }

  @override
  Future<AuthResponseModel> refreshToken(String? refreshToken) async {
    if (refreshToken == null) throw Exception('No refresh token found');

    final response = await _dio.post(
      '/auth/refresh',
      data: {'refreshToken': refreshToken, 'expiresInMins': 30},
    );

    final auth = AuthResponseModel.fromJson(response.data);
    await SecureStorage.saveTokens(
      accessToken: auth.accessToken,
      refreshToken: auth.refreshToken,
    );
    return auth;
  }

  @override
  Future<AuthResponseModel> getMe() async {
    log('called');
    final tokens = await SecureStorage.getTokens();
    final accessToken = tokens['accessToken'];

    if (accessToken == null) {
      throw Exception('No access token found');
    }

    try {
      final response = await _dio.get(
        '/auth/me',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      return AuthResponseModel.fromJson({
        ...response.data,
        'accessToken': accessToken,
        'refreshToken': tokens['refreshToken'],
      });
    } on DioException catch (e) {
      throw (Exception(e.toString()));
    }
  }
}

abstract class BaseAuthRepository {
  Future<AuthResponseModel> login(String username, String password);
  Future<void> logout();
  Future<AuthResponseModel> getMe();
  Future<AuthResponseModel> refreshToken(String? refreshToken);
}
