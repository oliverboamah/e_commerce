// flutter imports
import 'package:e_commerce/presentation/widgets/search/search_history_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports

class SearchHistoryList extends StatelessWidget {
  final List<String> searchHistoryList;
  final Function onItemClicked;

  SearchHistoryList(
      {@required this.searchHistoryList, @required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: this.searchHistoryList.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: SearchHistoryItem(title: this.searchHistoryList[index]),
          onTap: () => this.onItemClicked(index),
        );
      },
    );
  }
}
