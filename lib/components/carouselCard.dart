import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final String img;
  final String text;

  CarouselCard({
    required this.img,
    required this.text,
  }) : super(key: ObjectKey(img));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black87)),
      constraints: const BoxConstraints(
        maxWidth: 500
      ),
      child: Column(
        children: [
          Image.asset(img, ),
          Container(
              margin: const EdgeInsets.all(10),
              child: AutoSizeText(
                text,
                style: Theme.of(context).textTheme.bodyText2,
                maxFontSize: 21,
                maxLines: 12,
              ))
        ],
      ),
    );
  }
}
