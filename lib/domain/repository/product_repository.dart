import 'package:ecommerceapp/core/resources/data_state.dart';
import 'package:ecommerceapp/domain/entities/product.dart';

abstract class ProductRepository {
  Future<DataState<List<ProductEntity>>> getProducts();
}
