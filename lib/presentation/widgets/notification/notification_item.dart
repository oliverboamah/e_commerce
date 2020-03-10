// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/presentation/widgets/horizontal_line.dart';
import 'package:e_commerce/domain/models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notificationModel;

  NotificationItem({@required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(left: 16.0, top: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(this.notificationModel.image),
            radius: 45,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 14.0, bottom: 4.0),
                        child: Text(
                          this.notificationModel.title,
                          style: Theme.of(context).accentTextTheme.display1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, top: 10.0),
                        child: Text(
                          this.notificationModel.date,
                          style: Theme.of(context).textTheme.display2,
                        ),
                      )
                    ],
                  ),
                  Text(
                    this.notificationModel.subTitle,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Spacer(),
                  HorizontalLine(width: MediaQuery.of(context).size.width)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
