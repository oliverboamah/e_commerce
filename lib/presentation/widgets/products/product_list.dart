// flutter imports
import 'package:e_commerce/presentation/widgets/products/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> productModelList;
  final Function onItemClicked;

  ProductList({this.productModelList, this.onItemClicked});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
              childAspectRatio: (1/1.1),
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              children: List.generate(this.productModelList.length, (index) {
                return InkWell(
                  child: ProductItem(
                    productModel: this.productModelList[index],
                  ),
                  onTap: () => this.onItemClicked(index),
                );
              }),
            );
          },
        ));
  }
}
