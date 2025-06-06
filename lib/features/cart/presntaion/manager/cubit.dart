import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:x_store/features/cart/presntaion/manager/state.dart';
import '../../domain/entity/cart_data.dart';
import '../../domain/use_cse/get_cart_use_case.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this._getCartUseCase) : super(InitState());

  static CartCubit get(context) => BlocProvider.of(context);

  final GetCartUseCase _getCartUseCase;
  CartData? cartData;
  Future<void> getCart() async {
    emit(GetCartLoadingState());
    var result = await _getCartUseCase.call();
    result.fold((fail) {
      emit(GetCartErrorState());
    }, (data) {
      cartData = data;
      emit(GetCartSuccessState());
    });
  }
}
