// flutter imports
import 'package:flutter/cupertino.dart';

// third party imports
import 'package:equatable/equatable.dart';

// my app imports
import 'package:e_commerce/domain/models/register_model.dart';

@immutable
class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
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

@immutable
class CreateFirebaseUserEvent extends RegisterEvent {
  final RegisterModel registerModel;
  final Function stopLoading;

  CreateFirebaseUserEvent(
      {@required this.registerModel, @required this.stopLoading});

  @override
  List<Object> get props => [registerModel, stopLoading];

  @override
  String toString() => 'Create Firebase User Event';
}
