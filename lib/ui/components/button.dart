// flutter imports
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/values/dimen.dart';

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
          child: Text(this.text),
          onPressed: this.onPressed,
        ),
      ),
    );
  }
}
