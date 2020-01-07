// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// my app imports
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/values/dimen.dart';
import 'package:e_commerce/ui/components/password_field.dart';
import 'package:e_commerce/ui/models/login_model.dart';
import 'package:e_commerce/utils/email_validator.dart';
import 'package:e_commerce/ui/components/button.dart';

class LoginForm extends StatefulWidget {
  final Function onSubmit;
  final Function forgotPassword;

  LoginForm({this.onSubmit, this.forgotPassword});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => this.setState(() => this._email = value),
                decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(smallBorderRadius)),
                    filled: true,
                    fillColor: secondaryHighlightColor),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter email';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: smallSpacing),
                child: PasswordField(
                    onChanged: (value) =>
                        this.setState(() => this._password = value),
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
                      onTap: this.widget.forgotPassword,
                    )
                  ],
                ),
              ),
              Button(
                  text: 'Login',
                  onPressed: () {
                    if (this._formKey.currentState.validate()) {
                      this.widget.onSubmit(LoginModel(
                          email: this._email, password: this._password));
                    }
                  })
            ],
          )),
    );
  }
}
