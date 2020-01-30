// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/app_bar_with_cart.dart';
import 'package:e_commerce/ui/components/checkout/address_section.dart';
import 'package:e_commerce/ui/components/notification/notification_detail_list.dart';
import 'package:e_commerce/ui/components/secondary_section_header.dart';
import 'package:e_commerce/ui/components/vertical_line.dart';
import 'package:e_commerce/ui/models/cart_model.dart';
import 'package:e_commerce/ui/models/cart_model_list.dart';
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/values/colors.dart';

class NotificationDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationDetailPageState();
}

class _NotificationDetailPageState extends State<NotificationDetailPage> {
  CartModelList cartModelList = CartModelList();

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    for (int i = 0; i < 20; i++) {
      this.cartModelList.add(CartModel(
            status: 'pending',
            delivery: 'Delivered between Friday Jan 3 and Tuesday 7 Jan',
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
      appBar: AppBarWithCart(
        appBarTitle: 'Items Delivered',
        onCartClicked: () => {},
        context: context,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            color: primaryHighlightColor,
            child: Row(
              children: <Widget>[
                Text(
                  'Order No:',
                  style: Theme.of(context).accentTextTheme.body1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    '3000023324',
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
                Spacer(),
                Text(
                  '22-12-2019',
                  style: Theme.of(context).textTheme.display1,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Order Status',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          'Item(s) delivered on Tuesday, 22-12-2019, 12pm',
                          style: Theme.of(context).accentTextTheme.display1,
                        ),
                      )
                    ],
                  ),
                ),
                VerticalLine(
                  length: 108,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Text(
                          'Price',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Text(
                        '\$199',
                        style: Theme.of(context).accentTextTheme.display1,
                      )
                    ],
                  ),
                ),
                VerticalLine(
                  length: 108,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Text(
                          'Payment',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Text(
                        'MTN Momo',
                        style: Theme.of(context).accentTextTheme.display1,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          AddressSection(
            leadingTitle: 'Shipping Address',
            address:
                'Oliver Boamah\nHouse 14, American House\nEast Legon\n+233 55 329 5012',
            trailingTitle: '',
          ),
          SecondarySectionHeader(
            title: 'Item(s) in your Order',
          ),
          Container(
            height: 500,
            child: NotificationDetailList(
              cartModelList: this.cartModelList,
              onItemClicked: () => {},
            ),
          )
        ],
      ),
    );
  }
}
