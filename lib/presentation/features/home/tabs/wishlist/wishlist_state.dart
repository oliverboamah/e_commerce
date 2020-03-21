// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';

@immutable
abstract class WishlistState extends Equatable {
  final List<ProductModel> products;

  WishlistState({this.products});

  @override
  List<Object> get props => [products];
}

@immutable
class WishlistInitialState extends WishlistState {
  WishlistInitialState({List<ProductModel> products})
      : super(products: products);
}

@immutable
class WishlistLoadedState extends WishlistState {
  WishlistLoadedState({
    List<ProductModel> products,
  }) : super(products: products);
}
