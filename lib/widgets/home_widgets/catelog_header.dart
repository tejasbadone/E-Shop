import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogHeader extends StatefulWidget {
  @override
  _CatelogHeaderState createState() => _CatelogHeaderState();
}

class _CatelogHeaderState extends State<CatelogHeader> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catelog App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: context.theme.accentColor,
          ),
          textScaleFactor: 3,
        ),
        Text(
          'Trending products',
          style: TextStyle(
            color: context.theme.accentColor,
          ),
          textScaleFactor: 1.5,
        ),
      ],
    );
  }
}
