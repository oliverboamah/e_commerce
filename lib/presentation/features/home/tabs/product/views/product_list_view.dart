// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/views/product_item_view.dart';
import 'package:e_commerce/presentation/widgets/pk_skeleton.dart';

class ProductListView extends StatelessWidget {
  final List<ProductModel> productModelList;
  final Function onItemClicked;
  final Function onScrollEnd;
  final ScrollController _scrollController = ScrollController();
  final int maxLength;

  ProductListView(
      {this.productModelList,
      this.onItemClicked,
      this.onScrollEnd,
      this.maxLength});

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (_scrollController.position.extentAfter < 180) {
        this.onScrollEnd();
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return NotificationListener<ScrollNotification>(
              onNotification: _handleScrollNotification,
              child: GridView.count(
                controller: _scrollController,
                childAspectRatio: (1 / 1.1),
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                children: List.generate(
                    this.productModelList.length +
                        (orientation == Orientation.portrait ? 2 : 3), (index) {
                  if (this.productModelList.length < this.maxLength) {
                    if ((index == this.productModelList.length) ||
                        index == this.productModelList.length + 1 ||
                        index == this.productModelList.length + 2) {
                      return SingleChildScrollView(child: PKGridCardSkeleton());
                    }
                  }
                  if (index < this.productModelList.length) {
                    return InkWell(
                      child: ProductItemView(
                        productModel: this.productModelList[index],
                      ),
                      onTap: () => this.onItemClicked(index),
                    );
                  }
                  return Container();
                }),
              ),
            );
          },
        ));
  }
}
