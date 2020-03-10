// flutter imports
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Icon icon;
  final double badgeSize = 20.0;
  final String text;
  final Color textColor;
  final Color badgeColor;

  Badge(
      {@required this.icon,
      this.text = '0',
      this.textColor = Colors.white,
      this.badgeColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: this.icon,
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          width: this.badgeSize,
          height: this.badgeSize,
          alignment: Alignment.center,
          padding: EdgeInsets.all(2.0),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: this.badgeColor),
          child: Text(
            this.text,
            style: TextStyle(color: this.textColor),
          ),
        )
      ],
    );
  }
}
