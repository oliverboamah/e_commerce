import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/domain/models/register_model.dart';

@immutable
class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateUserEvent extends RegisterEvent {
  final RegisterModel registerModel;

  CreateUserEvent({this.registerModel});

  @override
  List<Object> get props => [registerModel];

  @override
  String toString() => 'Create User Event';
}

@immutable
class AgreeToTermsEvent extends RegisterEvent {
  final bool agreeToTerms;

  AgreeToTermsEvent({this.agreeToTerms});

  @override
  List<Object> get props => [agreeToTerms];

  @override
  String toString() => 'Agree To Terms Event';
}
