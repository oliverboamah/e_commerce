// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/data/factories/notification/notification_repository_factory.dart';
import 'package:e_commerce/presentation/features/home/tabs/notification/notification_event.dart';
import 'package:e_commerce/presentation/features/home/tabs/notification/notification_state.dart';
import 'package:e_commerce/data/remote/providers/remote_data_provider.dart';
import 'package:e_commerce/domain/models/notification_model.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepositoryFactory _notificationRepositoryFactory =
      NotificationRepositoryFactory(
          remoteDataProvider: RemoteDataProvider.firebase);

  @override
  NotificationState get initialState =>
      NotificationInitialState(notifications: []);

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    if (event is LoadNotificationsEvent) {
      List<NotificationModel> notifications = this.state.notifications;
      List<NotificationModel> newNotifications =
          await _notificationRepositoryFactory.getNotifications(
              state.notifications.isNotEmpty ? state.notifications.last.id : 0,
              0);

      notifications.addAll(newNotifications);

      yield NotificationsLoadedState(
          notifications: notifications,
          notificationsHashCode: DateTime.now().toIso8601String());
    }
  }
}
