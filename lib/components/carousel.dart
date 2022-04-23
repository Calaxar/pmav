import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pmav_flutter/components/carouselCard.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<CarouselCard> cards;

  CarouselWithIndicator({
    required this.cards,
  }) : super();

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<CarouselCard> cards = widget.cards;
    return Column(mainAxisSize: MainAxisSize.min, children: [
      CarouselSlider(
        items: cards,
        carouselController: _controller,
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
          enableInfiniteScroll: false,
          height: 500,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: cards.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
