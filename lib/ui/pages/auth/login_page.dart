// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/image_text.dart';
import 'package:e_commerce/ui/components/login_form.dart';
import 'package:e_commerce/ui/components/vertical_line.dart';
import 'package:e_commerce/values/dimen.dart';
import 'package:e_commerce/ui/models/login_model.dart';
import 'package:e_commerce/ui/routes/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _onSubmit(LoginModel loginModel) {
    Routes.goToHomePage(context);
  }

  _loginWithFacebook() {}

  _loginWithGoogle() {}

  _register() {
    Routes.goToRegisterPage(context);
  }

  _forgotPassword() {}

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
                LoginForm(
                  onSubmit: this._onSubmit,
                  forgotPassword: this._forgotPassword,
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
                        onTap: _register,
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
                        onTap: _loginWithGoogle,
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
                        onTap: _loginWithFacebook,
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
