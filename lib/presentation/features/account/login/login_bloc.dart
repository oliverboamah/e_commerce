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
        print(error);
        event.stopLoading();

        yield AuthUserErrorState(errorMessage: error.toString());
      }
    }
  }
}
