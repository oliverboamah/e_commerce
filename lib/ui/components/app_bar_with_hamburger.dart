// flutter imports
import 'package:flutter/material.dart';

class AppBarWithHamburger extends AppBar {
  final Function onHamburgerClicked;

  AppBarWithHamburger(
      {@required String title, BuildContext context, this.onHamburgerClicked})
      : super(
          elevation: 1,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => onHamburgerClicked(),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        );
}
