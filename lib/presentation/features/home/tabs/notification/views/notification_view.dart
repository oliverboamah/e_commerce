// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/widgets/pk_skeleton.dart';
import 'package:e_commerce/presentation/features/home/tabs/notification/views/notification_list_view.dart';
import 'package:e_commerce/presentation/features/home/tabs/notification/notification_bloc.dart';
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/presentation/widgets/app_bar_with_hamburger.dart';
import 'package:e_commerce/domain/models/notification_model.dart';
import 'package:e_commerce/presentation/features/home/tabs/notification/notification_event.dart';

class NotificationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotificationBloc>(context).add(LoadNotificationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> notifications =
        BlocProvider.of<NotificationBloc>(context).state.notifications;

    final int maxLength = 50;

    return Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBarWithHamburger(
          context: context,
          title: 'My Notification',
          onHamburgerClicked: () {
            print('hamburger clicked');
          },
        ),
        body: notifications.isEmpty
            ? PKCardListSkeleton(
                isBottomLinesActive: false,
              )
            : NotificationListView(
                maxLength: maxLength,
                notificationModels: notifications,
                onItemClicked: () => {},
                onScrollEnd: () {
                  if (notifications.length < maxLength) {
                    BlocProvider.of<NotificationBloc>(context)
                        .add(LoadNotificationsEvent());
                  }
                },
              ));
  }
}
