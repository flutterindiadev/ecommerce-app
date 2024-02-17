import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/resources/data_state.dart';
import 'package:ecommerceapp/domain/entities/product.dart';
import 'package:ecommerceapp/domain/usecases/get_products.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUsecase _getProductsUsecase;

  ProductBloc(this._getProductsUsecase) : super(const ProductInitial()) {
    on<GetProducts>(onGetProducts);
  }

  onGetProducts(GetProducts event, Emitter<ProductState> emitter) async {
    final datastate = await _getProductsUsecase();

    if (datastate is DataSuccess && datastate.data!.isNotEmpty) {
      emit(RemoteProductsLoaded(datastate.data!));
    }

    if (datastate is DataFailed) {
      emit(RemoteProductsError(datastate.exception!));
    }
  }
}
