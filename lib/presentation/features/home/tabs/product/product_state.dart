// flutter imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class ProductState extends Equatable {}

@immutable
class ProductInitialState extends ProductState {
  @override
  List<Object> get props => [];
}

@immutable
class ProductsLoadedState extends ProductState {
  final List<ProductModel> products;

  ProductsLoadedState({this.products});

  @override
  List<Object> get props => [products];
}
