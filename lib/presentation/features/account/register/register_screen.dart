// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Third part imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/account/register/register_bloc.dart';
import 'package:e_commerce/presentation/features/account/register/register_state.dart';
import 'package:e_commerce/presentation/features/account/register/views/register_view.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(),
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
        return RegisterView();
      },
    );
  }
}
