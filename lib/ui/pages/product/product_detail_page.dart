// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/app_bar_with_cart.dart';
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/ui/components/carousel_with_indicator.dart';
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/ui/components/discount.dart';
import 'package:e_commerce/ui/components/delivery_info_section.dart';
import 'package:e_commerce/ui/components/products/product_detail_section.dart';
import 'package:e_commerce/values/dimen.dart';
import 'package:e_commerce/ui/components/button_with_icon.dart';
import 'package:e_commerce/ui/components/quantity_counter.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel productModel;

  ProductDetailPage({this.productModel});

  @override
  State<StatefulWidget> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBarWithCart(
        context: context,
        productModel: this.widget.productModel,
        onCartClicked: () {
          print('cart clicked');
        },
      ),
      body: Column(
        children: <Widget>[
          CarouselWithIndicator(
            imageList: this.widget.productModel.images,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: dividerColor, width: 0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: defaultWidgetPadding,
                        right: defaultWidgetPadding,
                        top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            this.widget.productModel.name,
                            style: Theme.of(context).textTheme.title,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            this.widget.productModel.price,
                            style: Theme.of(context).accentTextTheme.display1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 8.0, top: 4.0),
                                child: Text(
                                  '\$255',
                                  style: Theme.of(context)
                                      .accentTextTheme
                                      .overline,
                                ),
                              ),
                              Discount(
                                discount: -37,
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: secondaryTextColor,
                                ),
                                onPressed: () => {},
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  DeliveryInfoSection(
                    headerTitle: 'Delivery Information',
                    body1: 'Express delivery in main cities.',
                    body2: 'Delivered by thursday 2 Jan',
                  ),
                  ProductDetailSection(
                    headerTitle: 'Product Detail',
                    body1:
                        '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM',
                  )
                ],
              ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Quantity',
                      style: Theme.of(context).accentTextTheme.display1,
                    ),
                    QuantityCounter()
                  ],
                ),
                ButtonWithIcon(
                  text: 'ADD TO CART',
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () => {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
