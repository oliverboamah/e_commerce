// flutter imports
import 'package:flutter/widgets.dart';

class ImageText extends StatelessWidget {
  final Text text;
  final Image image;
  static const spacing = 4.0;

  ImageText({@required this.text, @required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        this.image,
        Padding(
          padding: const EdgeInsets.only(left: spacing, ),
          child: this.text,
        )
      ],
    );
  }
}
