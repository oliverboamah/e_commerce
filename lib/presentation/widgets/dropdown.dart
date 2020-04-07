// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';

class Dropdown extends StatefulWidget {
  final List<String> options;
  final String hint;
  final Function onChanged;
  final String value;
  final bool isFieldRequired;

  Dropdown(
      {@required this.options,
      this.hint,
      @required this.onChanged,
      this.value = '',
      @required this.isFieldRequired});

  @override
  State<StatefulWidget> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 6.0,
            right: 16.0,
          ),
          child: DropdownButton<String>(
            hint: this.widget.hint != null ? Text(this.widget.hint) : null,
            value: this.widget.value,
            onChanged: (value) => this.widget.onChanged(value),
            style: Theme.of(context).textTheme.title,
            underline: Container(
              color: secondaryTextColor,
              height: 1,
            ),
            items: this.widget.options.map((String value) {
              return DropdownMenuItem<String>(
                value: value.toString(),
                child: new Text(value.toString()),
              );
            }).toList(),
            isExpanded: true,
          ),
        ),
        this.widget.isFieldRequired && this.widget.value == ''
            ? Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'field is required',
                  style: TextStyle(color: dangerColor),
                ),
              )
            : Container()
      ],
    );
  }
}
