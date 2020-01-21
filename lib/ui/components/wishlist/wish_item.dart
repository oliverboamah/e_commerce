// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/ui/components/horizontal_line.dart';

class WishItem extends StatelessWidget {
  final ProductModel productModel;

  WishItem({@required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 16.0, top: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(this.productModel.images[0]),
            radius: 45,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0, bottom: 4.0),
                    child: Text(
                      this.productModel.name,
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  Text(
                    this.productModel.price,
                    style: Theme.of(context).accentTextTheme.display1,
                  ),
                  Spacer(),
                  HorizontalLine(width: MediaQuery.of(context).size.width)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
