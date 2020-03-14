import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/presentation/features/account/login/login_bloc.dart';
import 'package:e_commerce/presentation/features/account/login/login_state.dart';
import 'package:e_commerce/presentation/features/account/login/views/login_view.dart';
import 'package:e_commerce/data/remote/auth/user_auth_repository.dart';
import 'package:e_commerce/config/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) =>
          LoginBloc(userAuthRepository: FirebaseUserAuthRepository()),
      child: LoginWrapper(),
    );
  }
}

class LoginWrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (BuildContext context, LoginState state) {
        return BlocListener<LoginBloc, LoginState>(
          listener: (BuildContext context, LoginState state) {
            if (state is AuthUserSuccessState) {
              Routes.goToHomeScreen(context);
            } else if (state is AuthUserErrorState) {
              Flushbar(
                flushbarPosition: FlushbarPosition.TOP,
                message: state.errorMessage,
                backgroundGradient: LinearGradient(
                  colors: [Colors.red, Colors.redAccent],
                ),
                duration: Duration(seconds: 5),
              )..show(context);
            }
          },
          child: LoginView(),
        );
      },
    );
  }
}
