// flutter imports
import 'package:e_commerce/presentation/features/home/home_screen.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: HomeScreen(),
        ));
  }
}
