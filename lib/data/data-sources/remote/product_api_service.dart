import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/constants.dart';
import 'package:ecommerceapp/data/model/product.dart';
import 'package:retrofit/retrofit.dart';

part 'product_api_service.g.dart';

@RestApi(baseUrl: productbaseUrl)
abstract class ProductAPIService {
  factory ProductAPIService(Dio dio) = _ProductAPIService;

  @GET("/products")
  Future<HttpResponse<List<ProductModel>>> getProducts();
}
