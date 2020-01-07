// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/fonts/heart_icons.dart';
import 'package:e_commerce/ui/fonts/home_icons.dart';
import 'package:e_commerce/ui/fonts/more_icon.dart';
import 'package:e_commerce/ui/fonts/notification_icons.dart';
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/values/dimen.dart';

class BottomNavBar extends StatefulWidget {
  final Function onTabSelected;

  BottomNavBar({this.onTabSelected});

  @override
  State<StatefulWidget> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  int _selectedTabIndex = 0;

  _onTabSelected(index) {
    this.setState(() => this._selectedTabIndex = index);
    this.widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: bottomNavBarBackgroundColor,
      child: Container(
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: primaryIconSize,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(
                HomeIcon.home,
                color: _selectedTabIndex == 0 ? primaryColor : primaryIconColor,
              ),
              onPressed: () => this._onTabSelected(0),
            ),
            IconButton(
              iconSize: primaryIconSize,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(HeartIcon.heart,
                  color:
                      _selectedTabIndex == 1 ? primaryColor : primaryIconColor),
              onPressed: () => this._onTabSelected(1),
            ),
            IconButton(
              iconSize: primaryIconSize,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(MoreIcon.more,
                  color:
                      _selectedTabIndex == 2 ? primaryColor : primaryIconColor),
              onPressed: () => this._onTabSelected(2),
            ),
            IconButton(
              iconSize: primaryIconSize,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(NotificationIcon.bell,
                  color:
                      _selectedTabIndex == 3 ? primaryColor : primaryIconColor),
              onPressed: () => this._onTabSelected(3),
            )
          ],
        ),
      ),
    );
  }
}
