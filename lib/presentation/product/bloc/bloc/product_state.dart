part of 'product_bloc.dart';

@immutable
sealed class ProductState {
  final List<ProductEntity>? products;
  final DioException? exception;

  const ProductState({this.exception, this.products});
}

final class ProductInitial extends ProductState {
  const ProductInitial();
}

class RemoteProductsLoading extends ProductState {
  const RemoteProductsLoading();
}

class RemoteProductsLoaded extends ProductState {
  const RemoteProductsLoaded(List<ProductEntity> products)
      : super(products: products);
}

class RemoteProductsError extends ProductState {
  const RemoteProductsError(DioException dioException)
      : super(exception: dioException);
}
