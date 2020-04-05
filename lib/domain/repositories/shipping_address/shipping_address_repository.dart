// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

// my app imports
import 'package:e_commerce/domain/models/shipping_address_model.dart';

@immutable
abstract class ShippingAddressRepository extends Equatable {
  Future<ShippingAddressModel> getAddress();

  @override
  List<Object> get props => [];
}
