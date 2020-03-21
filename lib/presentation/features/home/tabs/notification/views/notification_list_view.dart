// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/domain/models/notification_model.dart';
import 'package:e_commerce/presentation/features/home/tabs/notification/views/notification_item_view.dart';
import 'package:e_commerce/presentation/widgets/pk_skeleton.dart';

class NotificationListView extends StatelessWidget {
  final List<NotificationModel> notificationModels;
  final Function onItemClicked;
  final Function onScrollEnd;
  final ScrollController _scrollController = ScrollController();
  final int maxLength;

  NotificationListView(
      {@required this.notificationModels,
      @required this.onItemClicked,
      this.onScrollEnd,
      this.maxLength});

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      print(_scrollController.position.extentAfter);
      if (_scrollController.position.extentAfter <= 100) {
        this.onScrollEnd();
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: this.notificationModels.length + 1,
          itemBuilder: (context, index) {
            if (this.notificationModels.length < this.maxLength) {
              if (index == this.notificationModels.length) {
                return SingleChildScrollView(
                    child: PKCardSkeleton(
                  isBottomLinesActive: false,
                ));
              }
            }
            if (index < this.notificationModels.length) {
              return InkWell(
                child: NotificationItemView(
                  notificationModel: this.notificationModels[index],
                ),
                onTap: () => this.onItemClicked(index),
              );
            }
            return Container();
          },
        ));
  }
}
