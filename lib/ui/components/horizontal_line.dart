// flutter imports
import 'package:flutter/widgets.dart';

class HorizontalLine extends StatelessWidget {
  final double height;
  final double width;
  final color = Color(0xFFC4C4C4);

  HorizontalLine({this.width, this.height = 0.5});

  @override
  Widget build(BuildContext context) {
    return Container(height: this.height, width: this.width, color: this.color);
  }
}
