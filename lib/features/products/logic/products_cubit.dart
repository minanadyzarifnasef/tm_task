
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamweelytask/features/products/logic/products_state.dart';

import '../data/repo/products_repo.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo _productsRepo;

  ProductsCubit(this._productsRepo) : super(const ProductsState.initial()){getProduct();}



  void getProduct()async {
    try {
      emit(const ProductsState.loading());
      final response = await _productsRepo.getProducts();
      response.when(
        success: (response) {

          emit(ProductsState.success(response));
        },
        failure: (error) {
          emit(ProductsState.error(
            message: error.getUserFriendlyMessage(),
          ));
        },
      );
    }catch(e){
      emit(ProductsState.error(
        message: e.toString(),
      ));
    }
  }
}