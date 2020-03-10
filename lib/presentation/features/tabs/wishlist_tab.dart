// flutter imports
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/presentation/widgets/wishlist/wish_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/widgets/app_bar_with_hamburger.dart';

class WishListTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WishListTabState();
}

class _WishListTabState extends State<WishListTab> {
  List<ProductModel> productModels = [
    ProductModel(
        name: 'Lenovo x280',
        price: '\$ 1399',
        discount: '-37%',
        images: [
          'assets/images/lenovo.jpg',
          'assets/images/lenovo.jpg',
        ]),
    ProductModel(
        name: 'Lenovo x280',
        price: '\$ 1399',
        discount: '-37%',
        images: [
          'assets/images/lenovo.jpg',
          'assets/images/lenovo.jpg',
        ]),
    ProductModel(
        name: 'Lenovo x280',
        price: '\$ 1399',
        discount: '-37%',
        images: [
          'assets/images/lenovo.jpg',
          'assets/images/lenovo.jpg',
        ]),
    ProductModel(
        name: 'Lenovo x280',
        price: '\$ 1399',
        discount: '-37%',
        images: [
          'assets/images/lenovo.jpg',
          'assets/images/lenovo.jpg',
        ]),
  ];

  onItemClicked(index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBarWithHamburger(
          context: context,
          title: 'My WishList',
          onHamburgerClicked: () {
            print('hamburger clicked');
          },
        ),
        body: WishList(
          productModels: this.productModels,
          onItemClicked: this.onItemClicked,
        ));
  }
}
