// flutter imports;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/presentation/widgets/app_bar_with_cart.dart';
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/widgets/carousel_with_indicator.dart';
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/presentation/widgets/discount.dart';
import 'package:e_commerce/presentation/widgets/delivery_info_section.dart';
import 'package:e_commerce/config/dimen.dart';
import 'package:e_commerce/presentation/widgets/button_with_icon.dart';
import 'package:e_commerce/presentation/widgets/quantity_counter.dart';
import 'package:e_commerce/presentation/widgets/products/product_detail_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/config/app_settings.dart';
import 'package:e_commerce/presentation/features/product/product_detail_bloc.dart';
import 'package:e_commerce/presentation/features/product/product_detail_event.dart';
import 'package:e_commerce/presentation/features/home/home_bloc.dart';
import 'package:e_commerce/presentation/features/home/views/home_context.dart';

class ProductDetailView extends StatefulWidget {
  final ProductModel productModel;

  ProductDetailView({@required this.productModel});

  @override
  State<StatefulWidget> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    final ProductDetailBloc productDetailBloc =
        BlocProvider.of<ProductDetailBloc>(context);

    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBarWithCart(
        cartLength:
            BlocProvider.of<HomeBloc>(HomeContext.context).state.cart.size(),
        context: context,
        appBarTitle: this.widget.productModel.name,
        onCartClicked: () {
          productDetailBloc.add(OpenCartScreenEvent());
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
                            currencySymbol + this.widget.productModel.price,
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
                                  currencySymbol +
                                      '${this.widget.productModel.originalPrice}',
                                  style: Theme.of(context)
                                      .accentTextTheme
                                      .overline,
                                ),
                              ),
                              Discount(
                                discount: this.widget.productModel.discount,
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(
                                  productDetailBloc.state.isAddedToWishlist
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: secondaryTextColor,
                                ),
                                onPressed: () {
                                  productDetailBloc.add(
                                      AddProductToWishlistEvent(
                                          productModel:
                                              this.widget.productModel));
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  DeliveryInfoSection(
                    headerTitle: 'Delivery Information',
                    body1: this.widget.productModel.deliveryInfoLine1,
                    body2: this.widget.productModel.deliveryInfoLine2,
                    onDetailsClicked: () {
                      productDetailBloc.add(ShowDeliveryInfoModalEvent());
                    },
                  ),
                  ProductDetailSection(
                    headerTitle: 'Product Detail',
                    body1: this.widget.productModel.detail,
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
                    QuantityCounter(
                      quantity: 1,
                      onQuantityChanged: (index) => {},
                    )
                  ],
                ),
                ButtonWithIcon(
                  text: productDetailBloc.state.isAddedToCart
                      ? 'ADDED TO CART'
                      : 'ADD TO CART',
                  icon: Icon(Icons.shopping_cart),
                  onPressed: !productDetailBloc.state.isAddedToCart
                      ? () {
                          // add it to the cart in home bloc first, then
                          productDetailBloc.add(AddProductToCartEvent());
                        }
                      : () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
