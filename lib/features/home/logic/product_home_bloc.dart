import 'package:bloc_sqflite_caching_data/features/home/data/repo/product_repo.dart';
import 'package:bloc_sqflite_caching_data/features/home/logic/product_home_event.dart';
import 'package:bloc_sqflite_caching_data/features/home/logic/product_home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductBloc extends Bloc<HomeProductEvent, HomeProductState> {
  final ProductRepo _productRepo;

  HomeProductBloc(this._productRepo) : super(HomeInitialState()) {
    on<GetAllProductsEvent>(_getAllProducts);
  }

  Future<void> _getAllProducts(
      HomeProductEvent event, Emitter<HomeProductState> emit) async {
    if (event is GetAllProductsEvent) {
      emit(ProductLoadingState());
      final response = await _productRepo.getAllProducts();
      response.fold((failure) {
        emit(ProductFailureState(failure));
      }, (data) {
        emit(ProductSuccessState(data));
      });
    }
  }

}
