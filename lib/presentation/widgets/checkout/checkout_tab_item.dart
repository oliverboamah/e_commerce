// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutTabItem extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final TextStyle titleColor;

  CheckoutTabItem({this.title, this.backgroundColor, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.0),
          borderRadius: new BorderRadius.all(Radius.elliptical(100, 50)),
          color: this.backgroundColor),
      child: Text(
        this.title,
        style: this.titleColor,
      ),
    );
  }
}
