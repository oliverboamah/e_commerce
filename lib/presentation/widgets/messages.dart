import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flushbar/flushbar.dart';

enum MessageType { success, error, info }

class Messages extends Flushbar {
  static final _successColors = [Colors.green, Colors.greenAccent];
  static final _errorColors = [Colors.red, Colors.redAccent];
  static final _infoColors = [Colors.amber, Colors.amberAccent];

  Messages(
      {@required final String message, @required final MessageType messageType})
      : super(
          flushbarPosition: FlushbarPosition.TOP,
          message: message,
          backgroundGradient: LinearGradient(
            colors: messageType == MessageType.success
                ? _successColors
                : messageType == MessageType.error ? _errorColors : _infoColors,
          ),
          duration: Duration(seconds: 4),
        );
}
