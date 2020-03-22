// flutter imports
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';

class Discount extends StatelessWidget {
  final String discount;

  Discount({this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
        decoration: BoxDecoration(
            color: primaryHighlightColor,
            borderRadius: BorderRadius.circular(4.0)),
        child: Text(
          '${this.discount}',
          style: Theme.of(context).accentTextTheme.body1,
        ));
  }
}
