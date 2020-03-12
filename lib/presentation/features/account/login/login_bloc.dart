import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/presentation/features/account/login/login_event.dart';
import 'package:e_commerce/presentation/features/account/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    try {
      if (event is AuthenticateUserEvent) {
        // Todo : login
        await Future.delayed(Duration(seconds: 4));
        yield AuthUserSuccessState();
      }
    } catch (error) {
      yield AuthUserErrorState(errorMessage: error.toString());
    }
  }
}
