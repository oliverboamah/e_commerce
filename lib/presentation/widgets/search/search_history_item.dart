// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';

class SearchHistoryItem extends StatelessWidget {
  final String title;

  SearchHistoryItem({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.history,
            color: secondaryTextColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(this.title, style: Theme.of(context).textTheme.title,),
          )
        ],
      ),
    );
  }
}
