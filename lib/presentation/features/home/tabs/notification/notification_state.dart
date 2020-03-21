// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

// my app imports
import 'package:e_commerce/domain/models/notification_model.dart';

@immutable
abstract class NotificationState extends Equatable {
  final List<NotificationModel> notifications;

  NotificationState({this.notifications});

  @override
  List<Object> get props => [notifications];
}

@immutable
class NotificationInitialState extends NotificationState {
  NotificationInitialState({List<NotificationModel> notifications})
      : super(notifications: notifications);
}

@immutable
class NotificationsLoadedState extends NotificationState {
  final String notificationsHashCode;

  NotificationsLoadedState(
      {List<NotificationModel> notifications, this.notificationsHashCode})
      : super(notifications: notifications);
  @override
  List<Object> get props => [notifications, notificationsHashCode];
}
