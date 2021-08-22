import 'package:catelog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogHeader extends StatelessWidget {
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
