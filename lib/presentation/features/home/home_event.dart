// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

// my app imports
import 'package:e_commerce/domain/models/cart_model.dart';

@immutable
abstract class HomeEvent extends Equatable {}

@immutable
class OpenCartEvent extends HomeEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Open Cart Event';
}

@immutable
class AddProductToCartEvent extends HomeEvent {
  final CartModel cartModel;

  AddProductToCartEvent({this.cartModel});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Add Product to Cart Event';
}

@immutable
class RemoveProductFromCartEvent extends HomeEvent {
  final CartModel cartModel;

  RemoveProductFromCartEvent({this.cartModel});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Remove Product to Cart Event';
}

@immutable
class UpdateProductIndexInCartEvent extends HomeEvent {
  final CartModel cartModel;
  final int index;

  UpdateProductIndexInCartEvent({this.cartModel, @required this.index});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Update Product with index in Cart Event';
}

@immutable
class UpdateProductInCartEvent extends HomeEvent {
  final CartModel cartModel;

  UpdateProductInCartEvent({this.cartModel});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Update Product in Cart Event';
}
