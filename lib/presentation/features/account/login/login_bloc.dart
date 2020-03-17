// flutter imports
import 'package:flutter/services.dart';

// third part imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/account/login/login_event.dart';
import 'package:e_commerce/presentation/features/account/login/login_state.dart';
import 'package:e_commerce/data/remote/auth/firebase_user_auth_repository.dart';
import 'package:e_commerce/data/remote/auth/google_user_auth_repository.dart';
import 'package:e_commerce/data/remote/auth/facebook_user_auth_repository.dart';
import 'package:e_commerce/domain/repositories/user_auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserAuthRepository userAuthRepository;

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    try {
      if (event is AuthFirebaseUserEvent) {
        userAuthRepository = FirebaseUserAuthRepository();
        await (userAuthRepository as FirebaseUserAuthRepository).signIn(
            email: event.userAuthModel.email,
            password: event.userAuthModel.password);
        event.stopLoading();
      } else if (event is AuthGoogleUserEvent) {
        userAuthRepository = GoogleUserAuthRepository();
        String response =
            await (userAuthRepository as GoogleUserAuthRepository).signIn();
        print(response);
      } else if (event is AuthFacebookUserEvent) {
        userAuthRepository = FacebookUserAuthRepository();
        String response =
            await (userAuthRepository as FacebookUserAuthRepository).signIn();
        print(response);
      }

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
        case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
          errorMessage =
              'An account already exists with the same email in our database, Login by entering the details associated with this email';
          break;
        default:
          errorMessage = error.toString();
          print(error);
      }
      if (event is AuthFirebaseUserEvent) event.stopLoading();

      yield AuthUserErrorState(
          errorMessage: errorMessage, errorHashCode: error.hashCode);
    }
  }
}
