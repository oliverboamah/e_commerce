// flutter import
import 'package:e_commerce/presentation/widgets/checkout/address_section.dart';
import 'package:e_commerce/presentation/widgets/checkout/delivery_method_section.dart';
import 'package:e_commerce/presentation/widgets/checkout/shipment_section.dart';
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/domain/models/cart_model_list.dart';

class DeliveryTab extends StatefulWidget {
  final CartModelList cartModelList;

  DeliveryTab({this.cartModelList});

  @override
  State<StatefulWidget> createState() => _DeliveryTabState();
}

class _DeliveryTabState extends State<DeliveryTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 8.0),
      children: <Widget>[
        AddressSection(
          leadingTitle: 'Address Details',
          address:
              'Oliver Boamah\nHouse 14, American House\nEast Legon\n+233 55 329 5012',
          trailingTitle: 'Add',
        ),
        DeliveryMethodSection(),
        ShipmentSection(
          cartModelList: this.widget.cartModelList,
        )
      ],
    );
  }
}
