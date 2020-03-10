// flutter imports
import 'package:e_commerce/presentation/widgets/notification/notification_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/domain/models/notification_model.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationModel> notificationModels;
  final Function onItemClicked;

  NotificationList(
      {@required this.notificationModels, @required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.notificationModels.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: NotificationItem(
            notificationModel: this.notificationModels[index],
          ),
          onTap: () => this.onItemClicked(index),
        );
      },
    );
  }
}
