// flutter imports
import 'package:e_commerce/ui/pages/search/search_page.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/values/theme.dart';
import 'package:e_commerce/ui/pages/auth/login_page.dart';
import 'package:e_commerce/ui/pages/auth/register_page.dart';
import 'package:e_commerce/ui/pages/home_page.dart';
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/ui/pages/cart/cart_page.dart';
import 'package:e_commerce/ui/pages/product/product_detail_page.dart';
import 'package:e_commerce/ui/tabs/wishlist_tab.dart';
import 'package:e_commerce/ui/pages/address/address_page.dart';
import 'package:e_commerce/ui/pages/address/location_page.dart';
import 'package:e_commerce/ui/pages/checkout/checkout_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SearchPage(),
        ));
  }
}

//CartPage(
//productModel: ProductModel(
//name: 'Lenovo x280',
//price: '\$ 1399',
//discount: '-37%',
//images: [
//'assets/images/lenovo.jpg',
//'assets/images/lenovo.jpg',
//]),
//)
