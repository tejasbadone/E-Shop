import 'package:catelog_app/widgets/themes.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'E - Shop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.theme.accentColor,
              ),
              textScaleFactor: 3,
            ),
            ChangeThemeButton()
          ],
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
