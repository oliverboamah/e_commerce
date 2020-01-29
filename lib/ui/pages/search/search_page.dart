// flutter imports
import 'package:e_commerce/ui/components/search/search_history_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/search/search_result_list.dart';
import 'package:e_commerce/values/dimen.dart';
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/values/colors.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> _searchHistoryList = [
    'Infinix Hot 8',
    'Iphone X Max',
    'Apple Airpods',
    'Epson Projector',
    'Table Top Fridge',
    'PS4 Game Console'
  ];

  List<ProductModel> productModels = [
    ProductModel(
        name: 'Lenovo x280',
        price: '\$ 1399',
        discount: '-37%',
        images: [
          'assets/images/lenovo.jpg',
          'assets/images/lenovo.jpg',
        ]),
    ProductModel(
        name: 'Lenovo x280',
        price: '\$ 1399',
        discount: '-37%',
        images: [
          'assets/images/lenovo.jpg',
          'assets/images/lenovo.jpg',
        ]),
    ProductModel(
        name: 'Lenovo x280',
        price: '\$ 1399',
        discount: '-37%',
        images: [
          'assets/images/lenovo.jpg',
          'assets/images/lenovo.jpg',
        ]),
    ProductModel(
        name: 'Lenovo x280',
        price: '\$ 1399',
        discount: '-37%',
        images: [
          'assets/images/lenovo.jpg',
          'assets/images/lenovo.jpg',
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(defaultWidgetPadding),
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(CupertinoIcons.back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: defaultWidgetPadding),
                          child: TextField(
                            style: Theme.of(context).accentTextTheme.title,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Search Your Product',
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SearchHistoryList(
                searchHistoryList: this._searchHistoryList,
                onItemClicked: () => {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
