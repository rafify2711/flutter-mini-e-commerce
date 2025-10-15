import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/home/data/models/product.dart';
import '../utils/constants.dart';

part 'api_manger.g.dart';

@lazySingleton
@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiManger {
  @factoryMethod
  factory ApiManger(Dio dio) = _ApiManger;

  @GET(Constants.productsEndPoint)
  Future<List<Product>> getProduct();

  @GET(Constants.categoriesEndPoint)
  Future<List<String>> getCategories();
}
