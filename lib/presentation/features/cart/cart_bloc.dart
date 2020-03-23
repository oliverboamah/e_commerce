// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/cart/cart_event.dart';
import 'package:e_commerce/presentation/features/cart/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  @override
  CartState get initialState => CartInitialState();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is RemoveProductFromCartEvent) {
      yield RemoveProductFromCartState(uId: DateTime.now().toIso8601String());
    } else if (event is CallToOrderEvent) {
      yield CallToOrderState(uId: DateTime.now().toIso8601String());
    } else if (event is RemoveProductFromCartEvent) {
      yield RemoveProductFromCartState(uId: DateTime.now().toIso8601String());
    } else if (event is UpdateProductInCartEvent) {
      yield UpdateProductInCartState(
          uId: DateTime.now().toIso8601String(),
          cartModel: event.cartModel,
          index: event.index);
    } 
  }
}
