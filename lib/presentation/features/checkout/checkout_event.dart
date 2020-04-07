// flutter imports
import 'package:e_commerce/domain/models/shipping_address_model.dart';
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

@immutable
class LoadShippingAddressEvent extends CheckoutEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Load Shipping Address Event';
}

@immutable
class OpenAddressScreenEvent extends CheckoutEvent {
  final String title;

  OpenAddressScreenEvent({@required this.title});

  @override
  List<Object> get props => [title];

  @override
  String toString() => 'Open Address Screen Event';
}

@immutable
class UpdateShippingAddressEvent extends CheckoutEvent {
  final ShippingAddressModel shippingAddressModel;

  UpdateShippingAddressEvent({@required this.shippingAddressModel});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Update Shipping Address Event';
}
