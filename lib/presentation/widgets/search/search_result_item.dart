// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';

class SearchResultItem extends StatelessWidget {
  final ProductModel productModel;

  SearchResultItem({this.productModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(this.productModel.images[0]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.productModel.name,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      this.productModel.price,
                      style: Theme.of(context).accentTextTheme.body1,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
