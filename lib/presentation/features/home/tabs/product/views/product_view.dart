// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/presentation/widgets/category.dart';
import 'package:e_commerce/presentation/widgets/search_bar.dart';
import 'package:e_commerce/config/app_settings.dart';
import 'package:e_commerce/presentation/widgets/horizontal_line.dart';
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/views/category1_view.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/views/category2_view.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/views/category3_view.dart';

class ProductView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView>
    with SingleTickerProviderStateMixin {
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
              child: Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(0),
                      height: 136.5,
                      child: Container(
                        decoration:
                            BoxDecoration(color: colorWhite, boxShadow: [
                          BoxShadow(
                              color: dividerColor,
                              offset: Offset(0, 1),
                              blurRadius: 2),
                        ]),
                        child: Column(
                          children: <Widget>[
                            SearchBar(
                              onHamburgerClicked: () => {},
                              onSearchClicked: () => {},
                            ),
                            Category(
                              list: categories,
                              onItemSelected: (index) => {},
                              tabController: this._tabController,
                            ),
                            HorizontalLine(
                              width: MediaQuery.of(context).size.width,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          Category1View(),
                          Category2View(),
                          Category3View()
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
