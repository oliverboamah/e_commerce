// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/category.dart';
import 'package:e_commerce/ui/components/search_bar.dart';
import 'package:e_commerce/config.dart';
import 'package:e_commerce/ui/components/horizontal_line.dart';
import 'package:e_commerce/ui/components/products_tab.dart';
import 'package:e_commerce/values/colors.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  PageController _myPage = PageController(initialPage: 0);

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: categories.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorWhite,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          DefaultTabController(
            length: categories.length,
            child: Container(
              padding: EdgeInsets.all(0),
              height: 136.5,
              child: Container(
                decoration: BoxDecoration(color: colorWhite, boxShadow: [
                  BoxShadow(
                      color: dividerColor, offset: Offset(0, 1), blurRadius: 2),
                ]),
                child: Column(
                  children: <Widget>[
                    SearchBar(
                      onHamburgerClicked: () => {},
                      onSearchClicked: () => {},
                    ),
                    Category(
                      list: categories,
                      onItemSelected: this._onTabSelected,
                      tabController: this._tabController,
                    ),
                    HorizontalLine(
                      width: MediaQuery.of(context).size.width,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
              child: PageView(
                controller: _myPage,
                children: _getProductsTabs(),
                onPageChanged: (int) {
                  this._tabController.animateTo(int);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _onTabSelected(int index) {
    this.setState(() => this._myPage.jumpToPage(index));
  }

  List<Widget> _getProductsTabs() {
    var productsTabs = categories.map((categoryModel) {
      return ProductsTab(
        categoryModel: categoryModel,
      );
    }).toList();

    return productsTabs;
  }
}
