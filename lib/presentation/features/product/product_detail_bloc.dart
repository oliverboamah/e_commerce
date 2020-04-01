// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/product/product_detail_event.dart';
import 'package:e_commerce/presentation/features/product/product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  @override
  ProductDetailState get initialState => ProductDetailInitialState(
      isAddedToCart: false, isAddedToWishlist: false, quantity: 1);

  @override
  Stream<ProductDetailState> mapEventToState(ProductDetailEvent event) async* {
    if (event is AddProductToWishlistEvent) {
      yield ProductAddedToWishlistState(
          // save product to wishlist local db
          isAddedToWishlist: !this.state.isAddedToWishlist,
          isAddedToCart: this.state.isAddedToCart,
          quantity: this.state.quantity);
    } else if (event is AppendProductToCartEvent) {
      yield ProductAddedToCartState(
          isAddedToWishlist: this.state.isAddedToWishlist,
          isAddedToCart: true,
          quantity: this.state.quantity);
    } else if (event is OpenCartScreenEvent) {
      yield OpenCartScreenState(
          isAddedToWishlist: this.state.isAddedToWishlist,
          isAddedToCart: this.state.isAddedToCart,
          quantity: this.state.quantity,
          uId: DateTime.now().toIso8601String());
    } else if (event is ShowDeliveryInfoModalEvent) {
      yield ShowDeliveryInfoModalState(
          isAddedToWishlist: this.state.isAddedToWishlist,
          isAddedToCart: this.state.isAddedToCart,
          quantity: this.state.quantity,
          uId: DateTime.now().toIso8601String());
    } else if (event is RefreshProductDetailEvent) {
      yield ProductRefreshedState(
          isAddedToWishlist: this.state.isAddedToWishlist,
          isAddedToCart: this.state.isAddedToCart,
          quantity: this.state.quantity,
          uId: DateTime.now().toIso8601String());
    } else if (event is UpdateProductQuantityEvent) {
      yield ProductQuantityUpdatedState(
          isAddedToWishlist: this.state.isAddedToWishlist,
          isAddedToCart: this.state.isAddedToCart,
          quantity: event.quantity,
          uId: DateTime.now().toIso8601String());
    }
  }
}
