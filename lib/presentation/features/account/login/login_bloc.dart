import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/presentation/features/account/login/login_event.dart';
import 'package:e_commerce/presentation/features/account/login/login_state.dart';
import 'package:e_commerce/domain/repositories/user_auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserAuthRepository userAuthRepository;

  LoginBloc({@required this.userAuthRepository});

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is AuthenticateUserEvent) {
      try {
        await userAuthRepository.signIn(
            email: event.userAuthModel.email,
            password: event.userAuthModel.password);
        event.stopLoading();
        yield AuthUserSuccessState();
      } catch (error) {
        String errorMessage = '';

        switch ((error as PlatformException).code) {
          case 'ERROR_NETWORK_REQUEST_FAILED':
            errorMessage =
                'Login failed due to poor internet connection, Please check connection and try again';
            break;
          case 'ERROR_INVALID_EMAIL':
            errorMessage = 'Invalid Email, Please enter the correct email';
            break;
          case 'ERROR_USER_NOT_FOUND':
            errorMessage = 'No user with the provided credentials exists';
            break;
          case 'ERROR_WRONG_PASSWORD':
            errorMessage = 'Wrong password, please enter the correct password';
            break;
          case 'ERROR_TOO_MANY_REQUESTS':
            errorMessage =
                'We have temporarily blocked requests from this device due to many unsuccessful login attempts. Please try again later';
            break;
          default:
            errorMessage = error.toString();
        }
        event.stopLoading();

        yield AuthUserErrorState(
            errorMessage: errorMessage, errorHashCode: error.hashCode);
      }
    }
  }
}
