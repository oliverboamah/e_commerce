// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/search/search_result_item.dart';
import 'package:e_commerce/ui/models/product_model.dart';

class SearchResultList extends StatelessWidget {
  final List<ProductModel> productModels;
  final Function onItemClicked;

  SearchResultList(
      {@required this.productModels, @required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: this.productModels.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: SearchResultItem(productModel: this.productModels[index]),
          onTap: () => this.onItemClicked(index),
        );
      },
    );
  }
}
