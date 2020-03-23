// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

// my app imports
import 'package:e_commerce/domain/models/cart_model_list.dart';

@immutable
abstract class HomeState extends Equatable {
  final CartModelList cart;

  HomeState({this.cart});
  @override
  List<Object> get props => [cart];
}

@immutable
class HomeInitialState extends HomeState {
  HomeInitialState({@required CartModelList cart}) : super(cart: cart);
}

@immutable
class OpenCartState extends HomeState {
  OpenCartState({@required CartModelList cart}) : super(cart: cart);
}

@immutable
class ProductAddedToCartState extends HomeState {
  ProductAddedToCartState({@required CartModelList cart}) : super(cart: cart);
}
