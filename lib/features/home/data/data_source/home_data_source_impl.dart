import 'package:flutter_task/core/api_manger/api_manger.dart';
import 'package:flutter_task/features/home/data/data_source/home_data_source.dart';
import 'package:flutter_task/features/home/data/models/product.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  final ApiManger apiManger;
  HomeDataSourceImpl(this.apiManger);

  @override
  Future<List<Product>> getProducts() async {
      final response = await apiManger.getProduct();
      return response;
  }

  @override
  Future<List<String>> getCategories() async{
    final response = await apiManger.getCategories();
    return response;
  }


}