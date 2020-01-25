// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/values/dimen.dart';
import 'package:e_commerce/ui/components/app_bar_with_back_icon.dart';
import 'package:e_commerce/ui/components/cart/cart_list.dart';
import 'package:e_commerce/ui/models/cart_model.dart';
import 'package:e_commerce/ui/models/cart_model_list.dart';

class CartPage extends StatefulWidget {
  final ProductModel productModel;

  CartPage({this.productModel});

  @override
  State<StatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartModelList cartModelList = CartModelList();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    for (int i = 0; i < 20; i++) {
      this.cartModelList.add(CartModel(
            status: 'pending',
            productModel: ProductModel(
                name: 'Lenovo x280',
                price: '\$ 1399',
                discount: '-37%',
                images: [
                  'assets/images/lenovo.jpg',
                  'assets/images/lenovo.jpg',
                ]),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBarWithBackIcon(
        context: context,
        title: 'Shopping Cart',
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: CartList(
              cartModelList: this.cartModelList,
              onItemClicked: (index) => {},
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 4.0, horizontal: defaultWidgetPadding),
            decoration: BoxDecoration(color: colorWhite, boxShadow: [
              BoxShadow(
                  color: dividerColor, offset: Offset(0, -0.5), blurRadius: 0.5)
            ]),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(
                        '\$199',
                        style: Theme.of(context).accentTextTheme.display1,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border:
                                Border.all(color: primaryColor, width: 2.0)),
                        child: CupertinoButton(
                          padding: EdgeInsets.all(0),
                          minSize: shortButtonSize - 4,
                          child: Text(
                            'CALL TO ORDER',
                            style: Theme.of(context).textTheme.display3,
                          ),
                          onPressed: () => {},
                        ),
                      )),
                      Expanded(
                        child: CupertinoButton(
                          minSize: shortButtonSize,
                          padding: EdgeInsets.all(0),
                          color: primaryColor,
                          child: Text(
                            'COMPLETE YOUR ORDER',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          onPressed: () => {},
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
