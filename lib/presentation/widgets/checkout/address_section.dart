// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/presentation/widgets/checkout/tertiary_section_header.dart';

class AddressSection extends StatelessWidget {
  final String address;
  final String leadingTitle;
  final String trailingTitle;
  final Function onTrailingTitleTap;

  AddressSection(
      {this.address,
      this.leadingTitle,
      this.trailingTitle,
      this.onTrailingTitleTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TertiarySectionHeader(
          leadingTitle: this.leadingTitle,
          trailingTitle: this.trailingTitle,
          onTrailingTitleTap: () => this.onTrailingTitleTap(this.trailingTitle),
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
