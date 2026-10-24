import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_product.dart';
import 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  final GetProducts getProducts;

  ProductsCubit(this.getProducts) : super(ProductsInitial());

  Future<void> loadProducts() async {
    emit(ProductsLoading());

    final result = await getProducts();

    result.fold(
          (failure) => emit(ProductsError(failure.message)),
          (products) => emit(ProductsSuccess(products)),
    );
  }
}