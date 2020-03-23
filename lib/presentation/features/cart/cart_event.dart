// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

// my app imports
import 'package:e_commerce/domain/models/cart_model.dart';

@immutable
abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class RemoveProductFromCartEvent extends CartEvent {
  @override
  String toString() => 'Remove Product from Cart Event';
}

@immutable
class UpdateProductInCartEvent extends CartEvent {
  final CartModel cartModel;
  final int index;

  UpdateProductInCartEvent({this.cartModel, this.index});
  @override
  String toString() => 'Update Product from Cart Event';
}

@immutable
class CallToOrderEvent extends CartEvent {
  @override
  String toString() => 'Call to Order Event';
}

@immutable
class CompleteOrderEvent extends CartEvent {
  @override
  String toString() => 'Complete Order Event';
}
