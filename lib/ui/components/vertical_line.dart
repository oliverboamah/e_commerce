// flutter imports
import 'package:flutter/widgets.dart';

class VerticalLine extends StatelessWidget {
  final double length;
  final double width = 1.0;
  final color = Color(0xFF757575);

  VerticalLine({this.length = 24.0});

  @override
  Widget build(BuildContext context) {
    return Container(height: this.length, width: this.width, color: this.color);
  }
}
