import 'package:flutter_task/features/home/data/models/product.dart';

abstract class HomeDataSource {
  Future<List<Product>> getProducts();
  Future<List<String>> getCategories();
}