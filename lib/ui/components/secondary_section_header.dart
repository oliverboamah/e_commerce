// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/values/colors.dart';

class SecondarySectionHeader extends StatelessWidget {
  final String title;

  SecondarySectionHeader({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      color: secondaryHighlightColor,
      width: MediaQuery.of(context).size.width,
      child: Text(
        this.title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
