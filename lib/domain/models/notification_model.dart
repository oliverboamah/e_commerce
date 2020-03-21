// flutter imports
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/domain/models/cart_model_list.dart';

class NotificationModel {
  final int id;
  final CartModelList cartList;
  final String title;
  final String subTitle;
  final String date;
  final String image;

  NotificationModel(
      {this.id = 0,
      @required this.cartList,
      @required this.title,
      @required this.subTitle,
      @required this.date,
      @required this.image});
}
