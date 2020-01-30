// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/notification/order_item.dart';
import 'package:e_commerce/ui/models/cart_model_list.dart';

class NotificationDetailList extends StatelessWidget {
  final CartModelList cartModelList;
  final Function onItemClicked;

  NotificationDetailList(
      {@required this.cartModelList, @required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.cartModelList.size(),
      itemBuilder: (context, index) {
        return InkWell(
          child: OrderItem(
            cartModel: this.cartModelList.get(index),
          ),
          onTap: () => this.onItemClicked(index),
        );
      },
    );
  }
}
