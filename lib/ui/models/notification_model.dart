// flutter imports
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/ui/models/cart_list.dart';

class NotificationModel {
  final CartList cartList;
  final String title;
  final String subTitle;
  final String date;
  final String image;

  NotificationModel(
      {@required this.cartList,
      @required this.title,
      @required this.subTitle,
      @required this.date,
      @required this.image});
}
