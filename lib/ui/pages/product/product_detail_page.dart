// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/app_bar_with_cart.dart';
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/ui/components/carousel_with_indicator.dart';
import 'package:e_commerce/values/colors.dart';

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
      body: CarouselWithIndicator(
        imageList: this.widget.productModel.images,
      ),
    );
  }
}
