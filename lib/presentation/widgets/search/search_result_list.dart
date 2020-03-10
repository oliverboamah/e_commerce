// flutter imports
import 'package:e_commerce/presentation/widgets/search/search_result_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';

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
