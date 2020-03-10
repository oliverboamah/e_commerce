// flutter imports
import 'package:flutter/material.dart';

class AppBarWithBackIcon extends AppBar {
  final Function onCartClicked;

  AppBarWithBackIcon(
      {@required String title, BuildContext context, this.onCartClicked})
      : super(
          elevation: 1,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        );
}
