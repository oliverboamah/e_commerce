import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/domain/models/user_auth_model.dart';

@immutable
class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class AuthenticateUserEvent extends LoginEvent {
  final UserAuthModel userAuthModel;
  final Function stopLoading;

  AuthenticateUserEvent(
      {@required this.userAuthModel, @required this.stopLoading});

  @override
  List<Object> get props => [userAuthModel, stopLoading];

  @override
  String toString() => 'Authenticate User Event';
}
