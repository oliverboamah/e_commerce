// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/ui/components/notification/notification_item.dart';

class NotificationList extends StatelessWidget {
  final List<ProductModel> productModels;
  final Function onItemClicked;

  NotificationList(
      {@required this.productModels, @required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.productModels.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: NotificationItem(
            productModel: this.productModels[index],
          ),
          onTap: () => this.onItemClicked(index),
        );
      },
    );
  }
}
