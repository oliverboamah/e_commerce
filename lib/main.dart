// flutter imports
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/values/theme.dart';
import 'package:e_commerce/ui/pages/auth/login_page.dart';
import 'package:e_commerce/ui/pages/auth/register_page.dart';
import 'package:e_commerce/ui/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: HomePage(),
        ));
  }
}
