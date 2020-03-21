// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';

@immutable
abstract class ProductState extends Equatable {
  final List<ProductModel> products;

  ProductState({this.products});

  @override
  List<Object> get props => [products];
}

@immutable
class ProductInitialState extends ProductState {
  ProductInitialState({List<ProductModel> products})
      : super(products: products);
}

@immutable
class ProductsLoadedState extends ProductState {
  ProductsLoadedState({
    List<ProductModel> products,
  }) : super(
          products: products,
        );
}
