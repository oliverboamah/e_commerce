// flutter imports
import 'package:flutter/widgets.dart';

// my app imports
import 'package:e_commerce/data/remote/providers/remote_data_provider.dart';
import 'package:e_commerce/domain/models/notification_model.dart';
import 'package:e_commerce/data/local/notification/notification_local_repository.dart';
import 'package:e_commerce/data/remote/providers/firestore/notification/notification_firestore_repository.dart';

class NotificationRepositoryFactory {
  final RemoteDataProvider remoteDataProvider;
  NotificationLocalRepository _notificationLocalRepository;
  NotificationFirestoreRepository _notificationFirestoreRepository;
  bool _internetConnected = true;

  NotificationRepositoryFactory({@required this.remoteDataProvider}) {
    this._notificationLocalRepository = NotificationLocalRepository();
    this._notificationFirestoreRepository = NotificationFirestoreRepository();
  }

  Future<List<NotificationModel>> getNotifications(
      int notificationId, int numToLoad) async {
    if (!_internetConnected) {
      List<NotificationModel> notifications = await this
          ._notificationLocalRepository
          .getNotifications(notificationId, numToLoad);

      if (notifications.isNotEmpty) {
        return notifications;
      }
    }

    switch (this.remoteDataProvider) {
      case RemoteDataProvider.firebase:
        return await this
            ._notificationFirestoreRepository
            .getNotifications(notificationId, numToLoad);
        break;
      default:
        return await this
            ._notificationFirestoreRepository
            .getNotifications(notificationId, numToLoad);
    }
  }
}
