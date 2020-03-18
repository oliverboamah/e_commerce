// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/widgets/category.dart';
import 'package:e_commerce/presentation/widgets/search_bar.dart';
import 'package:e_commerce/config/app_settings.dart';
import 'package:e_commerce/presentation/widgets/horizontal_line.dart';
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/views/product_list_view.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/product_bloc.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/product_event.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/product_state.dart';

class ProductView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView>
    with SingleTickerProviderStateMixin {
  PageController _myPage = PageController(initialPage: 0);
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: categories.length);
  }

  @override
  Widget build(BuildContext context) {
    ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);

    if (productBloc.state is ProductInitialState) {
      productBloc.add(LoadProductsEvent(category: ''));
    }

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
                      onItemSelected: (index) => this._myPage.jumpToPage(index),
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
                child: Center(
                    child: BlocProvider.of<ProductBloc>(context).state
                            is ProductsLoadedState
                        ? PageView(
                            controller: _myPage,
                            children: _getProductsTabs(),
                            onPageChanged: (int) {
                              this._tabController.animateTo(int);
                            },
                          )
                        : CircularProgressIndicator())),
          )
        ],
      ),
    );
  }

  List<Widget> _getProductsTabs() {
    var productsTabs = categories.map((categoryModel) {
      return ProductListView(
        productModelList:
            (BlocProvider.of<ProductBloc>(context).state as ProductsLoadedState)
                .products,
        onItemClicked: (index) => {},
      );
    }).toList();

    return productsTabs;
  }
}
