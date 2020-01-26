// flutter imports
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/ui/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/components/horizontal_line.dart';

class PackageItem extends StatelessWidget {
  final int index;
  final int numItems;
  final CartModel cartModel;

  PackageItem(
      {@required this.index,
      @required this.cartModel,
      @required this.numItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Package ${(this.index + 1)} of ${this.numItems}',
            style: Theme.of(context).textTheme.body1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              this.cartModel.productModel.name,
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          Text(
            'Quantity: ${this.cartModel.quantity}',
            style: Theme.of(context).textTheme.body1,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0, top: 4.0),
            child: Text(
              this.cartModel.delivery,
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          HorizontalLine(
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
