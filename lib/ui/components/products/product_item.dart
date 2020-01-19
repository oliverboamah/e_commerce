// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/values/colors.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;

  ProductItem({this.productModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      color: primaryHighlightColor,
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Text(
                    '${this.productModel.discount}',
                    style: Theme.of(context).accentTextTheme.body1,
                  ))
            ],
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              this.productModel.image,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            this.productModel.name,
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            this.productModel.price,
            style: Theme.of(context).accentTextTheme.display1,
          )
        ],
      ),
    );
  }
}
