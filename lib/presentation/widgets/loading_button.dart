import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/config/dimen.dart';

class LoadingButton extends StatelessWidget {
  final String title;
  final Function onTap;

  LoadingButton({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: verticalTextSpacing, bottom: titleTextSize),
      child: ArgonButton(
        height: buttonSize,
        width: 350,
        borderRadius: 5.0,
        color: primaryColor,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        loader: Container(
          padding: EdgeInsets.all(10),
          child: SpinKitRotatingCircle(
            color: Colors.white,
            // size: loaderWidth ,
          ),
        ),
        onTap: (startLoading, stopLoading, btnState) =>
            onTap(startLoading, stopLoading, btnState),
      ),
    );
  }
}
