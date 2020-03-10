// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/dimen.dart';

class SearchBar extends StatefulWidget {
  final hintText = 'Search Your Product';
  final Function onSearchClicked;
  final Function onHamburgerClicked;

  SearchBar(
      {@required this.onSearchClicked, @required this.onHamburgerClicked});

  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultWidgetPadding),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: this.widget.onHamburgerClicked,
            ),
            Expanded(
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(left: defaultWidgetPadding),
                  child: TextField(
                    style: Theme.of(context).accentTextTheme.title,
                    decoration: InputDecoration.collapsed(
                      hintText: this.widget.hintText,
                    ),
                  ),
                ),
                onTap: this.widget.onSearchClicked,
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: this.widget.onSearchClicked,
            ),
          ],
        ),
      ),
    );
  }
}
