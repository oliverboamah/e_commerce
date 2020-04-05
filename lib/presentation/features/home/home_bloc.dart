// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/home/home_event.dart';
import 'package:e_commerce/presentation/features/home/home_state.dart';
import 'package:e_commerce/domain/models/cart_model_list.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeInitialState(cart: CartModelList());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is OpenCartEvent) {
      yield OpenCartState(
          cart: this.state.cart, uId: DateTime.now().toIso8601String());
    } else if (event is AddProductToCartEvent) {
      CartModelList cart = this.state.cart;
      if (event.cartModel.quantity < event.cartModel.productModel.count) {
        cart.add(event.cartModel);
        yield ProductAddedToCartState(
            cart: cart, uId: DateTime.now().toIso8601String());
      } else {
        yield ProductSoldOutState(
            cart: cart, uId: DateTime.now().toIso8601String());
      }
    } else if (event is RemoveProductFromCartEvent) {
      CartModelList cart = this.state.cart;
      cart.remove(event.cartModel);

      yield ProductRemovedFromCartState(cart: cart);
    } else if (event is UpdateProductInCartEvent) {
      CartModelList cart = this.state.cart;

      if (event.cartModel.quantity <= event.cartModel.productModel.count) {
        cart.updateIndex(event.index, event.cartModel);
        yield ProductUpdatedInCartState(
          cart: cart,
        );
      } else {
        print(event.cartModel.quantity);

        yield ProductSoldOutState(
            cart: cart, uId: DateTime.now().toIso8601String());
      }
    }
  }
}
