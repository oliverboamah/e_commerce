// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class HomeEvent extends Equatable {}

@immutable
class OpenCartEvent extends HomeEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Open Cart Event';
}
