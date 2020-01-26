// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/checkout/tertiary_section_header.dart';

class AddressSection extends StatelessWidget {
  final String address =
      'Oliver Boamah\nHouse 14, American House\nEast Legon\n+233 55 329 5012';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TertiarySectionHeader(
          leadingTitle: 'Address Details',
          trailingTitle: 'Add',
        ),
        Padding(
          padding: const EdgeInsets.only(
              right: 24.0, left: 24.0, top: 8.0, bottom: 16.0),
          child: Text(
            this.address,
            style: Theme.of(context).textTheme.body1,
          ),
        )
      ],
    );
  }
}
