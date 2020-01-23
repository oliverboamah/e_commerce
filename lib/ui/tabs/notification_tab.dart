// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/ui/components/app_bar_with_hamburger.dart';
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/ui/components/notification/notification_list.dart';

class NotificationTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
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
          title: 'Notifications',
          onHamburgerClicked: () {
            print('hamburger clicked');
          },
        ),
        body: NotificationList(
          productModels: this.productModels,
          onItemClicked: this.onItemClicked,
        ));
  }
}
