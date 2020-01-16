// flutter imports
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/values/colors.dart';

class TabItem extends StatelessWidget {
  final IconData iconData;
  final Color color = primaryTextColor;
  final String title;

  TabItem({this.iconData, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.iconData,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(this.title),
        )
      ],
    );
  }
}
