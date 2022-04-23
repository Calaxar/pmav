import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../constants/colors.dart';
import '../main.dart';

class Heading extends StatelessWidget {
  Heading({
    required this.text,
  }) : super(key: ObjectKey(text));

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 50, bottom: 15, top: 15),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline1,
            ),
            fit: BoxFit.scaleDown,
          ),
          const Divider(
            color: flagColor,
            thickness: 2.5,
            height: 4,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
