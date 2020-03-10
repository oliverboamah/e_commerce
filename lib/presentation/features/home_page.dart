// flutter imports
import 'package:e_commerce/presentation/features/tabs/home_tab.dart';
import 'package:e_commerce/presentation/features/tabs/notification_tab.dart';
import 'package:e_commerce/presentation/features/tabs/support_tab.dart';
import 'package:e_commerce/presentation/features/tabs/wishlist_tab.dart';
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/config/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/presentation/widgets/bottom_navbar.dart';
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/config/dimen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _myPage = PageController(initialPage: 0);
  List<Widget> _tabs = [
    HomeTab(),
    WishListTab(),
    SupportTab(),
    NotificationTab()
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
        onPressed: () {
          Routes.goToCartPage(
              context,
              ProductModel(
                  name: 'Lenovo x280',
                  price: '\$ 1399',
                  discount: '-37%',
                  images: [
                    'assets/images/lenovo.jpg',
                    'assets/images/lenovo.jpg',
                  ]));
        },
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
