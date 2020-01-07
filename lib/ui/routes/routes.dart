// flutter imports
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/pages/auth/login_page.dart';
import 'package:e_commerce/ui/pages/auth/register_page.dart';

class Routes {
  static void goToLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  static void goToRegisterPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }
}
