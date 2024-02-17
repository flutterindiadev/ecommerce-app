import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/resources/data_state.dart';
import 'package:ecommerceapp/data/data-sources/remote/product_api_service.dart';
import 'package:ecommerceapp/data/model/product.dart';
import 'package:ecommerceapp/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductAPIService _productAPIService;

  ProductRepositoryImpl(this._productAPIService);

  @override
  Future<DataState<List<ProductModel>>> getProducts() async {
    var response;
    try {
      response = await _productAPIService.getProducts();

      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
