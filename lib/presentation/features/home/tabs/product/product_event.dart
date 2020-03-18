// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class ProductEvent extends Equatable {}

@immutable
class LoadProductsEvent extends ProductEvent {
  final String category;

  LoadProductsEvent({this.category});

  @override
  List<Object> get props => [category];

  @override
  String toString() => 'Load Products Event';
}
