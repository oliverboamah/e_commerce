// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/presentation/widgets/horizontal_line.dart';
import 'package:e_commerce/domain/models/cart_model.dart';
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/presentation/widgets/quantity_counter.dart';

class CartItem extends StatelessWidget {
  final CartModel cartModel;

  CartItem({@required this.cartModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      padding: EdgeInsets.only(left: 16.0, top: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(this.cartModel.productModel.images[0]),
            radius: 45,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          this.cartModel.productModel.name,
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: secondaryTextColor,
                        ),
                        onPressed: () => {},
                      )
                    ],
                  ),
                  Text(
                    this.cartModel.productModel.price,
                    style: Theme.of(context).accentTextTheme.display1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        this.cartModel.productModel.originalPrice,
                        style: Theme.of(context).accentTextTheme.overline,
                      ),
                      QuantityCounter()
                    ],
                  ),
                  Spacer(),
                  HorizontalLine(width: MediaQuery.of(context).size.width)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
