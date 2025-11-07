import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/models/product_model.dart';

class ProductRepository implements BaseProductRepository {
  final dio = Dio();

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await dio.get('https://dummyjson.com/products');

      final data = (response.data['products'] as List)
          .map((data) => ProductModel.fromJson(data))
          .toList();

      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    try {
      final response = await dio.get('https://dummyjson.com/products/$id');
      log('response : ${response.data}');
      final data = ProductModel.fromJson(response.data);

      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final response = await dio.get(
        'https://dummyjson.com/products/search?q=$query',
      );

      final data = (response.data['products'] as List)
          .map((data) => ProductModel.fromJson(data))
          .toList();

      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getProductsbyCategory(String category) async {
    try {
      final response = await dio.get(
        'https://dummyjson.com/products/category/$category',
      );

      final data = (response.data['products'] as List)
          .map((data) => ProductModel.fromJson(data))
          .toList();

      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

abstract class BaseProductRepository {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(int id);
  Future<List<ProductModel>> searchProducts(String query);
  Future<List<ProductModel>> getProductsbyCategory(String category);
}
