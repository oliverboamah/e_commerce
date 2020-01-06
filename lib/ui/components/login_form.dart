// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// my app imports
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/values/dimen.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<LoginFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(smallBorderRadius)),
                    fillColor: secondaryTextColor),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: smallSpacing),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(smallBorderRadius)),
                        fillColor: secondaryTextColor),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: smallSpacing),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: linkColor),
                    )
                  ],
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: verticalTextSpacing, bottom: titleTextSize),
                  child: CupertinoButton(
                    minSize: buttonSize,
                    color: primaryColor,
                    child: Text('Login'),
                    onPressed: () => () {

                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}
