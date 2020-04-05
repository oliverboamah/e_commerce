// flutter imports
import 'package:flutter/material.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class CheckoutEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class TabSelectedEvent extends CheckoutEvent {
  final int tabSelectedIndex;

  TabSelectedEvent({@required this.tabSelectedIndex});

  @override
  List<Object> get props => [tabSelectedIndex];

  @override
  String toString() => 'Tab Selected Event';
}
