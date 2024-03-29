// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/config/dimen.dart';
import 'package:e_commerce/presentation/fonts/eye_off_icon.dart';

class PasswordField extends StatefulWidget {
  final Function validator;
  final String hintText;
  final Function onChanged;
  final TextEditingController controller;

  PasswordField(
      {this.validator,
      this.hintText = 'Password',
      this.onChanged,
      this.controller});

  @override
  State<StatefulWidget> createState() => _PasswordField();
}

class _PasswordField extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: this.widget.controller,
        onChanged: (value) => this.widget.onChanged(value),
        obscureText: this._obscureText,
        style: Theme.of(context).textTheme.title,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: this._obscureText
                  ? Icon(Icons.remove_red_eye)
                  : Icon(EyeOff.eye_hide),
              onPressed: () =>
                  this.setState(() => this._obscureText = !this._obscureText),
            ),
            hintText: this.widget.hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(smallBorderRadius)),
            filled: true,
            fillColor: secondaryHighlightColor),
        validator: (value) => this.widget.validator(value));
  }
}
