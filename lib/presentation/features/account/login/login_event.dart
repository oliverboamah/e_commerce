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

  AuthenticateUserEvent({@required this.userAuthModel});

  @override
  List<Object> get props => [userAuthModel];

  @override
  String toString() => 'Authenticate User Event';
}
