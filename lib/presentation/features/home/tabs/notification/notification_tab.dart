// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/home/tabs/notification/notification_bloc.dart';
import 'package:e_commerce/presentation/features/home/tabs/notification/notification_state.dart';
import 'package:e_commerce/presentation/features/home/tabs/notification/views/notification_view.dart';

class NotificationTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider<NotificationBloc>(
        create: (BuildContext context) => NotificationBloc(),
        child: NotificationlistWrapper());
  }

  @override
  bool get wantKeepAlive => true;
}

class NotificationlistWrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationlistWrapperState();
}

class _NotificationlistWrapperState extends State<NotificationlistWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (BuildContext context, NotificationState state) {
        return BlocListener<NotificationBloc, NotificationState>(
            listener: (BuildContext context, NotificationState state) {},
            child: NotificationView());
      },
    );
  }
}
