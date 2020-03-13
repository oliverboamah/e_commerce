import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/config/dimen.dart';
import 'package:e_commerce/config/routes.dart';
import 'package:e_commerce/domain/models/register_model.dart';
import 'package:e_commerce/presentation/features/account/register/register_bloc.dart';
import 'package:e_commerce/presentation/widgets/button.dart';
import 'package:e_commerce/presentation/widgets/input_field.dart';
import 'package:e_commerce/presentation/widgets/password_field.dart';
import 'package:e_commerce/utils/email_validator.dart';
import '../register_event.dart';

class RegisterView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();

    this._firstNameController = TextEditingController();
    this._lastNameController = TextEditingController();
    this._emailController = TextEditingController();
    this._passwordController = TextEditingController();
    this._confirmPasswordController = TextEditingController();
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
                    'Register',
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Form(
                      key: _formKey,
                      autovalidate: true,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: InputField(
                                    controller: this._firstNameController,
                                    hintText: 'Firstname',
                                    validator: (value) {
                                      if (value.trim().isEmpty) {
                                        return 'Please enter firstname';
                                      }
                                      return null;
                                    }),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: smallSpacing),
                                  child: InputField(
                                      controller: this._lastNameController,
                                      hintText: 'Lastname',
                                      validator: (value) {
                                        if (value.trim().isEmpty) {
                                          return 'Please enter lastname';
                                        }
                                        return null;
                                      }),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: smallSpacing),
                            child: InputField(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: smallSpacing),
                            child: PasswordField(
                                controller: this._passwordController,
                                validator: (value) {
                                  if (value.trim().isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: smallSpacing),
                            child: PasswordField(
                                controller: this._confirmPasswordController,
                                hintText: 'Confirm Password',
                                validator: (value) {
                                  if (value.trim().isEmpty) {
                                    return 'Please re-enter password';
                                  }
                                  if (value.trim() !=
                                      this._passwordController.text.trim()) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                }),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: smallSpacing),
                              child: Row(children: <Widget>[
                                Checkbox(
                                  value: (BlocProvider.of<RegisterBloc>(context)
                                          .state)
                                      .agreeToTerms,
                                  checkColor: primaryColor,
                                  activeColor: primaryHighlightColor,
                                  onChanged: (value) =>
                                      BlocProvider.of<RegisterBloc>(context)
                                          .add(AgreeToTermsEvent(
                                              agreeToTerms: value)),
                                ),
                                Text('I agree to the '),
                                InkWell(
                                  child: Text(
                                    'Terms & Conditions',
                                    style: TextStyle(color: linkColor),
                                  ),
                                  onTap: () => {},
                                )
                              ])),
                          Button(
                              text: 'Register',
                              onPressed: () {
                                if (BlocProvider.of<RegisterBloc>(context)
                                        .state
                                        .agreeToTerms &&
                                    this._formKey.currentState.validate()) {
                                  BlocProvider.of<RegisterBloc>(context).add(
                                      CreateUserEvent(
                                          registerModel: RegisterModel(
                                              firstName: this
                                                  ._firstNameController
                                                  .text
                                                  .trim(),
                                              lastName: this
                                                  ._lastNameController
                                                  .text
                                                  .trim(),
                                              email: this
                                                  ._emailController
                                                  .text
                                                  .trim(),
                                              password: this
                                                  ._passwordController
                                                  .text
                                                  .trim())));
                                }
                              })
                        ],
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account?',
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: InkWell(
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.display3,
                        ),
                        onTap: () => Routes.goToLoginScreen(context),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
