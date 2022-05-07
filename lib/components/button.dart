import 'package:flutter/material.dart';

import '../constants/colors.dart';

class StyledButton extends StatelessWidget {
  StyledButton({
    required this.onPressed,
    required this.text,
  }) : super(key: ObjectKey(text));

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    var body = Theme.of(context).textTheme.bodyText1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                    color: flagColor
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.white,
                textStyle: body,
              ),
              onPressed: onPressed,
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}

class StyledButtonAlt extends StatelessWidget {
  StyledButtonAlt({
    required this.onPressed,
    required this.text,
  }) : super(key: ObjectKey(text));

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    var body = Theme.of(context).textTheme.bodyText1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          textStyle: body,
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(decoration: TextDecoration.underline),),
      ),
    );
  }
}