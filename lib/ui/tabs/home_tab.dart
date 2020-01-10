import 'package:e_commerce/ui/components/search_bar.dart';
import 'package:flutter/cupertino.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Column(
        children: <Widget>[
          SearchBar(
            onHamburgerClicked: () => {},
            onSearchClicked: () => {},
          ),
        ],
      ),
    );
  }
}
