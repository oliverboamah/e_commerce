// flutter imports
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
