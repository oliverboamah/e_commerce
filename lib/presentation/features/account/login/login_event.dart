// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

// my app imports
import 'package:e_commerce/domain/models/user_auth_model.dart';

@immutable
class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class AuthFirebaseUserEvent extends LoginEvent {
  final Function stopLoading;
  final UserAuthModel userAuthModel;

  AuthFirebaseUserEvent(
      {@required this.userAuthModel, @required this.stopLoading});

  @override
  List<Object> get props => [userAuthModel, stopLoading];

  @override
  String toString() => 'Authenticate Firebase User Event';
}

@immutable
class AuthGoogleUserEvent extends LoginEvent {
  AuthGoogleUserEvent();

  @override
  String toString() => 'Authenticate Google User Event';
}
