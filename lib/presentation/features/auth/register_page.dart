// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/dimen.dart';
import 'package:e_commerce/presentation/widgets/register_form.dart';
import 'package:e_commerce/domain/models/register_model.dart';
import 'package:e_commerce/config/routes.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  _onSubmit(RegisterModel registerModel) {}

  _onTermsAndConditionsClicked() {}

  _login() {
    Routes.goToLoginPage(context);
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
                RegisterForm(
                    onSubmit: this._onSubmit,
                    onTermsAndConditionsClicked: _onTermsAndConditionsClicked),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account?',
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: smHorizontalTextSpacing),
                      child: InkWell(
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.display3,
                        ),
                        onTap: _login,
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
