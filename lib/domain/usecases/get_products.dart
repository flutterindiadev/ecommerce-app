import 'package:ecommerceapp/core/resources/data_state.dart';
import 'package:ecommerceapp/core/usecases/usecase.dart';
import 'package:ecommerceapp/domain/entities/product.dart';
import 'package:ecommerceapp/domain/repository/product_repository.dart';

class GetProductsUsecase
    implements Usecase<DataState<List<ProductEntity>>, void> {
  final ProductRepository _productRepository;

  GetProductsUsecase(this._productRepository);

  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _productRepository.getProducts();
  }
}
