// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/config/dimen.dart';

class Button extends StatelessWidget {
  final String text;
  final double widthFactor;
  final Function onPressed;

  Button(
      {@required this.text, this.widthFactor = 1.0, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: this.widthFactor,
      child: Padding(
        padding: const EdgeInsets.only(
            top: verticalTextSpacing, bottom: titleTextSize),
        child: CupertinoButton(
          minSize: buttonSize,
          color: primaryColor,
          child: Text(
            this.text,
            style: Theme.of(context).accentTextTheme.display2,
          ),
          onPressed: this.onPressed,
        ),
      ),
    );
  }
}
