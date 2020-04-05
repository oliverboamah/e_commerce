// flutter imports
import 'package:e_commerce/domain/models/cart_model.dart';
import 'package:flutter/material.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class CartInitialState extends CartState {}

@immutable
class CallToOrderState extends CartState {
  final String uId;

  CallToOrderState({this.uId});

  @override
  List<Object> get props => [uId];
}

@immutable
class CompleteOrderState extends CartState {
  final String uId;

  CompleteOrderState({this.uId});

  @override
  List<Object> get props => [uId];
}

@immutable
class CartScreenRefreshedState extends CartState {
  final String uId;

  CartScreenRefreshedState({this.uId});

  @override
  List<Object> get props => [uId];
}
