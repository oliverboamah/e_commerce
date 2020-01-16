// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/tab_item.dart';
import 'package:e_commerce/ui/models/category_model.dart';
import 'package:e_commerce/values/colors.dart';

class Category extends StatefulWidget {
  final Function onItemSelected;
  final List<CategoryModel> list;
  final TabController tabController;

  Category(
      {@required this.list, @required this.onItemSelected, this.tabController});

  @override
  State<StatefulWidget> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: primaryTextColor,
      tabs: this._getTabs(),
      onTap: this.widget.onItemSelected,
      controller: this.widget.tabController,
    );
  }

  List<Widget> _getTabs() {
    return this.widget.list.map((category) {
      return (Tab(
        child: TabItem(
          iconData: category.iconData,
          title: category.name,
        ),
      ));
    }).toList();
  }
}
