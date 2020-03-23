// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';

@immutable
abstract class ProductDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class AddProductToWishlistEvent extends ProductDetailEvent {
  final ProductModel productModel;

  AddProductToWishlistEvent({@required this.productModel});

  @override
  List<Object> get props => [productModel];

  @override
  String toString() => 'Add Product to Wishlist Event';
}

@immutable
class AddProductToCartEvent extends ProductDetailEvent {
  @override
  String toString() => 'Add Product to Cart Event';
}

@immutable
class OpenCartScreenEvent extends ProductDetailEvent {
  @override
  String toString() => 'Open Cart Screen Event';
}

@immutable
class ShowDeliveryInfoModalEvent extends ProductDetailEvent {
  @override
  String toString() => 'Show Delivery Info modal Event';
}

@immutable
class UpdateProductQuantity extends ProductDetailEvent {
  final int quantity;

  UpdateProductQuantity({@required this.quantity});

  @override
  List<Object> get props => [quantity];

  @override
  String toString() => 'Update Product Quantity Event';
}
