// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/config/dimen.dart';

class ButtonWithIcon extends StatelessWidget {
  final Icon icon;
  final String text;
  final double widthFactor;
  final Function onPressed;

  ButtonWithIcon(
      {@required this.icon,
      @required this.text,
      this.widthFactor = 1.0,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: this.widthFactor,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
        child: CupertinoButton(
          minSize: shortButtonSize,
          color: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: icon,
              ),
              Text(
                this.text,
                style: Theme.of(context).accentTextTheme.display2,
              )
            ],
          ),
          onPressed: this.onPressed,
        ),
      ),
    );
  }
}
