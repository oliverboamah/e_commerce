// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/config/dimen.dart';
import 'package:e_commerce/presentation/widgets/password_field.dart';
import 'package:e_commerce/utils/email_validator.dart';
import 'package:e_commerce/presentation/widgets/button.dart';
import 'package:e_commerce/presentation/widgets/input_field.dart';
import 'package:e_commerce/domain/models/register_model.dart';

class RegisterForm extends StatefulWidget {
  final Function onSubmit;
  final Function onTermsAndConditionsClicked;

  RegisterForm({this.onSubmit, this.onTermsAndConditionsClicked});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _confirmPassword;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: InputField(
                        hintText: 'Firstname',
                        onChanged: (value) =>
                            this.setState(() => this._firstName = value.trim()),
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
                          hintText: 'Lastname',
                          onChanged: (value) => this
                              .setState(() => this._lastName = value.trim()),
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
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email',
                    onChanged: (value) =>
                        this.setState(() => this._email = value.trim()),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Please enter email';
                      }
                      if (!EmailValidator.validate(this._email)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: smallSpacing),
                child: PasswordField(
                    onChanged: (value) =>
                        this.setState(() => this._password = value.trim()),
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
                    hintText: 'Confirm Password',
                    onChanged: (value) => this
                        .setState(() => this._confirmPassword = value.trim()),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Please re-enter password';
                      }

                      if (this._confirmPassword != this._password) {
                        return 'Passwords do not match';
                      }

                      return null;
                    }),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: smallSpacing),
                  child: Row(children: <Widget>[
                    Checkbox(
                      value: this._agreeToTerms,
                      checkColor: primaryColor,
                      activeColor: primaryHighlightColor,
                      onChanged: (value) =>
                          this.setState(() => this._agreeToTerms = value),
                    ),
                    Text('I agree to the '),
                    InkWell(
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(color: linkColor),
                      ),
                      onTap: this.widget.onTermsAndConditionsClicked,
                    )
                  ])),
              Button(
                  text: 'Register',
                  onPressed: () {
                    if (this._formKey.currentState.validate()) {
                      this.widget.onSubmit(RegisterModel(
                          firstName: this._firstName,
                          lastName: this._lastName,
                          email: this._email,
                          password: this._password));
                    }
                  })
            ],
          )),
    );
  }
}
