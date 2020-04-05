// flutter imports
import 'package:e_commerce/presentation/features/address/address_screen.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/presentation/features/account/login/login_screen.dart';
import 'package:e_commerce/presentation/features/account/register/register_screen.dart';
import 'package:e_commerce/presentation/features/home/home_screen.dart';
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/features/product/product_detail_screen.dart';
import 'package:e_commerce/presentation/features/cart/cart_screen.dart';
import 'package:e_commerce/presentation/features/checkout/checkout_screen.dart';
import 'package:e_commerce/domain/models/shipping_address_model.dart';

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
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  static void goToProductDetailScreen(
      BuildContext context, ProductModel productModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetalScreen(
                  productModel: productModel,
                )));
  }

  static Future<String> goToCartScreen(
    BuildContext context,
  ) async {
    return await Navigator.push(
        context, MaterialPageRoute<String>(builder: (context) => CartScreen()));
  }

  static void goToCheckoutScreen(
    BuildContext context,
  ) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
  }

  static Future<ShippingAddressModel> goToAddressScreenForResult(
      BuildContext context, String appBarTitle) async {
    return await Navigator.push(
        context,
        MaterialPageRoute<ShippingAddressModel>(
            builder: (context) => AddressScreen(
                  appBarTitle: appBarTitle,
                )));
  }
}
