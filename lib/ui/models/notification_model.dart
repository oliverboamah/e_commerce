// flutter imports
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/ui/models/product_model.dart';

class NotificationModel {
  final List<ProductModel> productModels;
  final String summary;
  final String date;

  NotificationModel(
      {@required this.productModels,
      @required this.summary,
      @required this.date});
}
