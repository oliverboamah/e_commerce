import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class RegisterState extends Equatable {
  final bool agreeToTerms;

  RegisterState({this.agreeToTerms});

  @override
  List<Object> get props => [agreeToTerms];
}

@immutable
class RegisterInitialState extends RegisterState {
  RegisterInitialState({bool agreeToTerms}) : super(agreeToTerms: agreeToTerms);
}

@immutable
class RegisterSuccessState extends RegisterState {
  RegisterSuccessState({bool agreeToTerms}) : super(agreeToTerms: agreeToTerms);
}

@immutable
class RegisterErrorState extends RegisterState {
  final String errorMessage;

  RegisterErrorState({bool agreeToTerms, this.errorMessage})
      : super(agreeToTerms: agreeToTerms);

  @override
  List<Object> get props => [agreeToTerms, errorMessage];
}

@immutable
class AgreeToTermsState extends RegisterState {
  AgreeToTermsState({bool agreeToTerms}) : super(agreeToTerms: agreeToTerms);
}
