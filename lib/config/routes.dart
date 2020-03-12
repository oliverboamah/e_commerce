// flutter imports
import 'package:e_commerce/presentation/features/account/login/login_screen.dart';
import 'package:e_commerce/presentation/features/account/register/register_screen.dart';
import 'package:e_commerce/presentation/features/cart/cart_page.dart';
import 'package:e_commerce/presentation/features/product/product_detail_page.dart';
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/features/home_page.dart';
import 'package:flutter/material.dart';

// my app imports
class Routes {
  static void goToLoginScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  static void goToRegisterScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

  static void goToHomeScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  static void goToProductDetailPage(
      BuildContext context, ProductModel productModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetailPage(
                  productModel: productModel,
                )));
  }

  static void goToCartPage(BuildContext context, ProductModel productModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CartPage(
                  productModel: productModel,
                )));
  }
}
