// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/home/home_bloc.dart';
import 'package:e_commerce/presentation/features/home/home_event.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/product_tab.dart';
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/config/dimen.dart';
import 'package:e_commerce/presentation/features/home/tabs/wishlist/wishlist_tab.dart';
import 'package:e_commerce/presentation/features/home/tabs/support/support_tab.dart';
import 'package:e_commerce/presentation/widgets/bottom_navbar.dart';
import 'package:e_commerce/presentation/features/home/tabs/notification/notification_tab.dart';
import 'package:e_commerce/presentation/features/home/views/home_context.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    HomeContext.context = context;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        onTabSelected: (index) => this._myPage.jumpToPage(index),
      ),
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {},
        children: [
          ProductTab(),
          WishlistTab(),
          SupportTab(),
          NotificationTab()
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorWhite,
        onPressed: () {
          BlocProvider.of<HomeBloc>(context).add(OpenCartEvent());
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
      ),
    );
  }
}
