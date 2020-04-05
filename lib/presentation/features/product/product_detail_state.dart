// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class ProductDetailState extends Equatable {
  final bool isAddedToWishlist;

  ProductDetailState({
    @required this.isAddedToWishlist,
  });

  @override
  List<Object> get props => [isAddedToWishlist];
}

@immutable
class ProductDetailInitialState extends ProductDetailState {
  ProductDetailInitialState({
    @required bool isAddedToWishlist,
  }) : super(
          isAddedToWishlist: isAddedToWishlist,
        );
}

@immutable
class ProductAddedToWishlistState extends ProductDetailState {
  ProductAddedToWishlistState({@required bool isAddedToWishlist})
      : super(
          isAddedToWishlist: isAddedToWishlist,
        );
}

@immutable
class OpenCartScreenState extends ProductDetailState {
  final String uId;

  OpenCartScreenState({@required bool isAddedToWishlist, this.uId})
      : super(
          isAddedToWishlist: isAddedToWishlist,
        );
  @override
  List<Object> get props => [isAddedToWishlist, uId];
}

@immutable
class ShowDeliveryInfoModalState extends ProductDetailState {
  final String uId;

  ShowDeliveryInfoModalState({@required bool isAddedToWishlist, this.uId})
      : super(
          isAddedToWishlist: isAddedToWishlist,
        );

  @override
  List<Object> get props => [isAddedToWishlist, uId];
}

@immutable
class RefreshedScreenState extends ProductDetailState {
  final String uId;

  RefreshedScreenState({@required bool isAddedToWishlist, this.uId})
      : super(
          isAddedToWishlist: isAddedToWishlist,
        );

  @override
  List<Object> get props => [isAddedToWishlist, uId];
}
