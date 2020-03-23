// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class ProductDetailState extends Equatable {
  final bool isAddedToWishlist;
  final bool isAddedToCart;
  final int quantity;

  ProductDetailState(
      {@required this.isAddedToWishlist,
      @required this.isAddedToCart,
      this.quantity});

  @override
  List<Object> get props => [isAddedToWishlist, isAddedToCart, quantity];
}

@immutable
class ProductDetailInitialState extends ProductDetailState {
  ProductDetailInitialState(
      {@required bool isAddedToWishlist,
      @required bool isAddedToCart,
      @required int quantity})
      : super(
            isAddedToWishlist: isAddedToWishlist,
            isAddedToCart: isAddedToCart,
            quantity: quantity);
}

@immutable
class ProductAddedToWishlistState extends ProductDetailState {
  ProductAddedToWishlistState(
      {@required bool isAddedToWishlist,
      @required bool isAddedToCart,
      @required int quantity})
      : super(
            isAddedToWishlist: isAddedToWishlist,
            isAddedToCart: isAddedToCart,
            quantity: quantity);
}

@immutable
class ProductAddedToCartState extends ProductDetailState {
  ProductAddedToCartState(
      {@required bool isAddedToWishlist,
      @required bool isAddedToCart,
      @required int quantity})
      : super(
            isAddedToWishlist: isAddedToWishlist,
            isAddedToCart: isAddedToCart,
            quantity: quantity);
}

@immutable
class OpenCartScreenState extends ProductDetailState {
  final String uId;

  OpenCartScreenState(
      {@required bool isAddedToWishlist,
      @required bool isAddedToCart,
      @required int quantity,
      this.uId})
      : super(
            isAddedToWishlist: isAddedToWishlist,
            isAddedToCart: isAddedToCart,
            quantity: quantity);
  @override
  List<Object> get props => [isAddedToWishlist, isAddedToCart, quantity, uId];
}

@immutable
class ShowDeliveryInfoModalState extends ProductDetailState {
  final String uId;

  ShowDeliveryInfoModalState(
      {@required bool isAddedToWishlist,
      @required bool isAddedToCart,
      @required int quantity,
      this.uId})
      : super(
            isAddedToWishlist: isAddedToWishlist,
            isAddedToCart: isAddedToCart,
            quantity: quantity);

  @override
  List<Object> get props => [isAddedToWishlist, isAddedToCart, quantity, uId];
}
