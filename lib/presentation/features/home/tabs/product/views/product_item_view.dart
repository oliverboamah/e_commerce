// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/widgets/discount.dart';

class ProductItemView extends StatelessWidget {
  final ProductModel productModel;

  ProductItemView({this.productModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(),
                Discount(
                  discount: -37,
                )
              ],
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                this.productModel.images[0],
                fit: BoxFit.fill,
              ),
            ),
            Text(
              this.productModel.name,
              style: Theme.of(context).textTheme.title,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                this.productModel.price,
                style: Theme.of(context).accentTextTheme.display1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
