// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/account/register/register_bloc.dart';
import 'package:e_commerce/presentation/features/account/register/register_state.dart';
import 'package:e_commerce/presentation/features/account/register/views/register_view.dart';
import 'package:e_commerce/config/routes.dart';
import 'package:e_commerce/data/remote/auth/user_auth_repository.dart';
import 'package:e_commerce/presentation/widgets/messages.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) =>
          RegisterBloc(userAuthRepository: FirebaseUserAuthRepository()),
      child: RegisterWrapper(),
    );
  }
}

class RegisterWrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterWrapperState();
}

class _RegisterWrapperState extends State<RegisterWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (BuildContext context, RegisterState state) {
        return BlocListener<RegisterBloc, RegisterState>(
          listener: (BuildContext context, RegisterState state) {
            if (state is RegisterSuccessState) {
              Routes.goToLoginScreen(context);
              Messages(
                messageType: MessageType.success,
                message: 'Account created successfully, you can login now',
              )..show(context);
            } else if (state is RegisterErrorState) {
              Messages(
                messageType: MessageType.error,
                message: state.errorMessage,
              )..show(context);
            }
          },
          child: RegisterView(),
        );
      },
    );
  }
}
