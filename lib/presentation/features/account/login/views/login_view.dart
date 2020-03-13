import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:e_commerce/config/routes.dart';
import 'package:e_commerce/presentation/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/config/dimen.dart';
import 'package:e_commerce/domain/models/user_auth_model.dart';
import 'package:e_commerce/presentation/features/account/login/login_bloc.dart';
import 'package:e_commerce/presentation/features/account/login/login_event.dart';
import 'package:e_commerce/presentation/widgets/button.dart';
import 'package:e_commerce/presentation/widgets/image_text.dart';
import 'package:e_commerce/presentation/widgets/input_field.dart';
import 'package:e_commerce/presentation/widgets/password_field.dart';
import 'package:e_commerce/presentation/widgets/vertical_line.dart';
import 'package:e_commerce/utils/email_validator.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60, bottom: 32),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 48,
                  ),
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Form(
                      autovalidate: true,
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          InputField(
                              controller: this._emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.trim().isEmpty) {
                                  return 'Please enter email';
                                }
                                if (!EmailValidator.validate(value.trim())) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              }),
                          Padding(
                            padding: const EdgeInsets.only(top: smallSpacing),
                            child: PasswordField(
                                controller: _passwordController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: smallSpacing),
                            child: Row(
                              children: <Widget>[
                                Spacer(),
                                InkWell(
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(color: linkColor),
                                  ),
                                  onTap: () => {},
                                )
                              ],
                            ),
                          ),
                          LoadingButton(
                            title: 'Login',
                            onTap: (startLoading, stopLoading, btnState) {
                              if (btnState == ButtonState.Idle &&
                                  this._formKey.currentState.validate()) {
                                startLoading();
                                BlocProvider.of<LoginBloc>(context).add(
                                    AuthenticateUserEvent(
                                        stopLoading: stopLoading,
                                        userAuthModel: UserAuthModel(
                                            email: this._emailController.text,
                                            password: this
                                                ._passwordController
                                                .text)));
                              }
                            },
                          )
                        ],
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New on E-Commerce?',
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: smHorizontalTextSpacing),
                      child: InkWell(
                        child: Text(
                          'Create an Account',
                          style: Theme.of(context).textTheme.display3,
                        ),
                        onTap: () => Routes.goToRegisterScreen(context),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: verticalTextSpacing, bottom: 12),
                  child: Text('or login with'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: smHorizontalTextSpacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: ImageText(
                          image: Image.asset(
                            'assets/images/google.png',
                            width: largeIconSize,
                          ),
                          text: Text(
                            'Google',
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                        onTap: () => {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: verticalTextSpacing),
                        child: VerticalLine(),
                      ),
                      InkWell(
                        child: ImageText(
                          image: Image.asset(
                            'assets/images/facebook.png',
                            width: largeIconSize,
                          ),
                          text: Text('Facebook',
                              style: Theme.of(context).textTheme.title),
                        ),
                        onTap: () => {},
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
