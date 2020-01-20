// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/values/dimen.dart';

class InputField extends StatelessWidget {
  final Function validator;
  final String hintText;
  final Function onChanged;
  final TextInputType keyboardType;

  InputField(
      {this.validator,
      this.hintText,
      this.onChanged,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: (value) => this.onChanged(value),
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(smallBorderRadius)),
          filled: true,
          fillColor: secondaryHighlightColor),
      validator: (value) => this.validator(value),
    );
  }
}