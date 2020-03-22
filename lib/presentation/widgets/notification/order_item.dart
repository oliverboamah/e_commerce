// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/presentation/widgets/discount.dart';
import 'package:e_commerce/presentation/widgets/horizontal_line.dart';
import 'package:e_commerce/domain/models/cart_model.dart';
import 'package:e_commerce/config/colors.dart';

class OrderItem extends StatelessWidget {
  final CartModel cartModel;

  OrderItem({@required this.cartModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      cartModel.productModel.images[0],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0, top: 16.0),
                        child: Text(
                          cartModel.productModel.name,
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '${this.cartModel.productModel.price}',
                            style: Theme.of(context).accentTextTheme.display1,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '\$${this.cartModel.productModel.originalPrice}',
                              style: Theme.of(context).accentTextTheme.overline,
                            ),
                          ),
                          Discount(
                            discount: '-37%',
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Quantity:',
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            '${this.cartModel.quantity}',
                            style: Theme.of(context).accentTextTheme.display1,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                        child: Row(
                          children: <Widget>[
                            Text('Status'),
                            Container(
                              margin: EdgeInsets.only(left: 8.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2.0),
                              child: Text(
                                '${this.cartModel.status}',
                                style: Theme.of(context).textTheme.subhead,
                              ),
                              decoration: BoxDecoration(
                                  color: successColor,
                                  borderRadius: BorderRadius.circular(4)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, bottom: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Product Details',
                    style: Theme.of(context).textTheme.title),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Text(
                      '-Display 12.4 HD, retina display\n-Memory: 256 SSD, 16 GB RAM',
                      style: Theme.of(context).textTheme.display1),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, bottom: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Delivery Information',
                    style: Theme.of(context).textTheme.title),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '-Express delivery in main cities\n-Delivered by thursday 2 Jan',
                        style: Theme.of(context).textTheme.display1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          'Details',
                          style: Theme.of(context).accentTextTheme.body2,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: HorizontalLine(),
          )
        ],
      ),
    );
  }
}
