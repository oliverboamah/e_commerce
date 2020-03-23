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
