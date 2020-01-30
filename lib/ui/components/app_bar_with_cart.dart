// flutter imports
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/badge.dart';
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/values/colors.dart';

class AppBarWithCart extends AppBar {
  final String appBarTitle;
  final Function onCartClicked;

  AppBarWithCart(
      {@required this.appBarTitle, @required BuildContext context, this.onCartClicked})
      : super(
          elevation: 1,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            appBarTitle,
            style: Theme.of(context).textTheme.title,
          ),
          actions: <Widget>[
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Badge(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: primaryIconColor,
                  ),
                  text: '3',
                  badgeColor: primaryColor,
                ),
              ),
              onTap: onCartClicked,
            )
          ],
        );
}
