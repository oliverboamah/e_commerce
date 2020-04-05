// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';

class TertiarySectionHeader extends StatelessWidget {
  final String leadingTitle;
  final String trailingTitle;
  final Function onTrailingTitleTap;

  TertiarySectionHeader(
      {@required this.leadingTitle,
      @required this.trailingTitle,
      @required this.onTrailingTitleTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        color: secondaryHighlightColor,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              this.leadingTitle,
              style: Theme.of(context).textTheme.title,
            ),
            InkWell(
              child: Text(
                this.trailingTitle,
                style: Theme.of(context).accentTextTheme.body1,
              ),
              onTap: () => this.onTrailingTitleTap(),
            )
          ],
        ));
  }
}
