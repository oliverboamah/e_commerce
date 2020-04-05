// flutter imports
import 'package:flutter/material.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class CheckoutState extends Equatable {
  final int selectedTabIndex;

  CheckoutState({@required this.selectedTabIndex});

  @override
  List<Object> get props => [selectedTabIndex];
}

@immutable
class CheckoutInitialState extends CheckoutState {
  CheckoutInitialState({@required int selectedTabIndex})
      : super(selectedTabIndex: selectedTabIndex);
}

@immutable
class TabSelectedState extends CheckoutState {
  TabSelectedState({@required int selectedTabIndex})
      : super(selectedTabIndex: selectedTabIndex);
}
