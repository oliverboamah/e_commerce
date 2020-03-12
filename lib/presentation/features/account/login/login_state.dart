import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class LoginInitialState extends LoginState {}

@immutable
class AuthUserSuccessState extends LoginState {}

@immutable
class AuthUserErrorState extends LoginState {
  final String errorMessage;

  AuthUserErrorState({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
