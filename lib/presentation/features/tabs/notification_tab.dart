// flutter imports
import 'package:e_commerce/presentation/widgets/notification/notification_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/widgets/app_bar_with_hamburger.dart';
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/domain/models/cart_model_list.dart';
import 'package:e_commerce/domain/models/cart_model.dart';
import 'package:e_commerce/domain/models/notification_model.dart';

class NotificationTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  List<NotificationModel> notificationModels = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    for (int i = 0; i < 20; i++) {
      this.notificationModels.add(
            NotificationModel(
                cartList: CartModelList.initial(list: [
                  CartModel(
                    status: 'pending',
                    productModel: ProductModel(
                        name: 'Lenovo x280',
                        price: '\$ 1399',
                        discount: '-37%',
                        images: [
                          'assets/images/lenovo.jpg',
                          'assets/images/lenovo.jpg',
                        ]),
                  )
                ]),
                date: '24-01-2020',
                title: 'Item Shipped',
                subTitle: 'Checkout order details',
                image: 'assets/images/lenovo.jpg'),
          );
    }
  }

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
          notificationModels: this.notificationModels,
          onItemClicked: this.onItemClicked,
        ));
  }
}
