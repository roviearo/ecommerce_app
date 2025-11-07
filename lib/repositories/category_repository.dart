import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/category_model.dart';

class CategoryRepository implements BaseCategoryRepository {
  final dio = Dio();

  @override
  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final response = await dio.get(
        'https://dummyjson.com/products/categories?limit=5',
      );

      final data = (response.data as List)
          .map((data) => CategoryModel.fromJson(data))
          .toList();

      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

abstract class BaseCategoryRepository {
  Future<List<CategoryModel>> getAllCategory();
}
