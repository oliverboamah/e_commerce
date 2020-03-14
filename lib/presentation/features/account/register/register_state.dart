// flutter imports
import 'package:flutter/cupertino.dart';

// third party imports
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
  final int errorHashCode;

  RegisterErrorState(
      {@required bool agreeToTerms,
      @required this.errorMessage,
      @required this.errorHashCode})
      : super(agreeToTerms: agreeToTerms);

  @override
  List<Object> get props => [agreeToTerms, errorMessage, errorHashCode];
}

@immutable
class AgreeToTermsState extends RegisterState {
  AgreeToTermsState({bool agreeToTerms}) : super(agreeToTerms: agreeToTerms);
}
