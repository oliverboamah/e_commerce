// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
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

@immutable
class RefreshCartScreenEvent extends CartEvent {
  @override
  String toString() => 'Refresh Cart Screen Event';
}
