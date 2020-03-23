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
      yield OpenCartState(cart: this.state.cart);
    } else if (event is AddProductToCartEvent) {
      CartModelList cart = this.state.cart;
      cart.add(event.cartModel);

      yield ProductAddedToCartState(cart: cart);
    }
  }
}
