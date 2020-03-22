// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class ProductDetailState extends Equatable {
  final bool isAddedToWishlist;
  final bool isAddedToCart;

  ProductDetailState(
      {@required this.isAddedToWishlist, @required this.isAddedToCart});

  @override
  List<Object> get props => [isAddedToWishlist, isAddedToCart];
}

@immutable
class ProductDetailInitialState extends ProductDetailState {
  ProductDetailInitialState(
      {@required bool isAddedToWishlist, @required bool isAddedToCart})
      : super(
            isAddedToWishlist: isAddedToWishlist, isAddedToCart: isAddedToCart);
}

@immutable
class ProductAddedToWishlistState extends ProductDetailState {
  ProductAddedToWishlistState(
      {@required bool isAddedToWishlist, @required bool isAddedToCart})
      : super(
            isAddedToWishlist: isAddedToWishlist, isAddedToCart: isAddedToCart);
}

@immutable
class ProductAddedToCartState extends ProductDetailState {
  ProductAddedToCartState(
      {@required bool isAddedToWishlist, @required bool isAddedToCart})
      : super(
            isAddedToWishlist: isAddedToWishlist, isAddedToCart: isAddedToCart);
}

@immutable
class OpenCartScreenState extends ProductDetailState {
  final String uId;

  OpenCartScreenState(
      {@required bool isAddedToWishlist,
      @required bool isAddedToCart,
      this.uId})
      : super(
          isAddedToWishlist: isAddedToWishlist,
          isAddedToCart: isAddedToCart,
        );
  @override
  List<Object> get props => [isAddedToWishlist, isAddedToCart, uId];
}

@immutable
class ShowDeliveryInfoModalState extends ProductDetailState {
  final String uId;

  ShowDeliveryInfoModalState(
      {@required bool isAddedToWishlist,
      @required bool isAddedToCart,
      this.uId})
      : super(
            isAddedToWishlist: isAddedToWishlist, isAddedToCart: isAddedToCart);

  @override
  List<Object> get props => [isAddedToWishlist, isAddedToCart, uId];
}
