// flutter import
import 'package:e_commerce/presentation/features/checkout/checkout_bloc.dart';
import 'package:e_commerce/presentation/features/checkout/checkout_event.dart';
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/domain/models/cart_model_list.dart';
import 'package:e_commerce/presentation/widgets/checkout/address_section.dart';
import 'package:e_commerce/presentation/widgets/checkout/delivery_method_section.dart';
import 'package:e_commerce/presentation/widgets/checkout/shipment_section.dart';
import 'package:e_commerce/domain/models/shipping_address_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryTab extends StatefulWidget {
  final CartModelList cartModelList;
  final ShippingAddressModel shippingAddressModel;

  DeliveryTab({this.cartModelList, this.shippingAddressModel});

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
          address: this.widget.shippingAddressModel == null
              ? ''
              : '${this.widget.shippingAddressModel.firstName} ' +
                  '${this.widget.shippingAddressModel.lastName}\n' +
                  '${this.widget.shippingAddressModel.addressLine1}\n' +
                  '${this.widget.shippingAddressModel.addressLine2}\n' +
                  '${this.widget.shippingAddressModel.town}, ${this.widget.shippingAddressModel.city}\n' +
                  '${this.widget.shippingAddressModel.phoneNumber1}, ${this.widget.shippingAddressModel.phoneNumber2}',
          trailingTitle:
              this.widget.shippingAddressModel == null ? 'Add' : 'Change',
          onTrailingTitleTap: (title) => BlocProvider.of<CheckoutBloc>(context)
              .add(OpenAddressScreenEvent(title: title)),
        ),
        DeliveryMethodSection(),
        ShipmentSection(
          cartModelList: this.widget.cartModelList,
        )
      ],
    );
  }
}
