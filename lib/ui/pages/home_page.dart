// flutter imports
import 'package:e_commerce/ui/tabs/home_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/bottom_navbar.dart';
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/values/dimen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _myPage = PageController(initialPage: 0);
  List<Widget> _tabs = [
    HomeTab(),
    Center(
      child: Container(
        child: Text('WishList Tab'),
      ),
    ),
    Center(
      child: Container(
        child: Text('Support Tab'),
      ),
    ),
    Center(
      child: Container(
        child: Text('Notification Tab'),
      ),
    )
  ];

  _onTabSelected(int index) {
    this.setState(() => this._myPage.jumpToPage(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        onTabSelected: this._onTabSelected,
      ),
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: this._tabs,
        physics:
            NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorWhite,
        onPressed: () {},
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.shopping_cart,
                color: primaryIconColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              width: badgeSize,
              height: badgeSize,
              alignment: Alignment.center,
              padding: EdgeInsets.all(2.0),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: primaryColor),
              child: Text(
                '2',
                style: TextStyle(color: colorWhite),
              ),
            )
          ],
        ),
        // elevation: 5.0,
      ),
    );
  }
}
