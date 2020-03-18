// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class HomeState extends Equatable {}

@immutable
class HomeInitialState extends HomeState {
  @override
  List<Object> get props => [];
}

@immutable
class OpenCartState extends HomeState {
  @override
  List<Object> get props => [];
}
