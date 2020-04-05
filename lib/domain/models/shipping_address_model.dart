// flutter imports
import 'package:flutter/material.dart';

@immutable
class ShippingAddressModel {
  final String firstName;
  final String lastName;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String town;
  final String phoneNumber1;
  final String phoneNumber2;

  ShippingAddressModel(
      {@required this.firstName,
      @required this.lastName,
      @required this.addressLine1,
      this.addressLine2,
      this.city,
      this.town,
      @required this.phoneNumber1,
      this.phoneNumber2});
}
