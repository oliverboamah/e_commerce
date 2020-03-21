// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class NotificationEvent extends Equatable {}

@immutable
class LoadNotificationsEvent extends NotificationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Load Notifications Event';
}
