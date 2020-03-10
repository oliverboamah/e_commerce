// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';

class PrimarySectionHeader extends StatelessWidget {
  final String title;

  PrimarySectionHeader({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      color: primaryHighlightColor,
      width: MediaQuery.of(context).size.width,
      child: Text(
        this.title,
        style: Theme.of(context).accentTextTheme.body1,
      ),
    );
  }
}
