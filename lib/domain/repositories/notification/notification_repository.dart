// flutter imports
import 'package:flutter/widgets.dart';

// my app imports
import 'package:e_commerce/domain/models/notification_model.dart';

@immutable
abstract class NotificationRepository {
  Future<List<NotificationModel>> getNotifications(
      int notificationId, int numToLoad);
}
