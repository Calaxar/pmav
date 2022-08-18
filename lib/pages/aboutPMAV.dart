import 'package:flutter/material.dart';
import 'package:pmav_flutter/components/carousel.dart';
import 'package:pmav_flutter/components/carouselCard.dart';
import 'package:pmav_flutter/components/heading.dart';
import 'package:pmav_flutter/main.dart';

Widget aboutPMAV(context) {
  var body = Theme.of(context).textTheme.bodyText1;
  final List<CarouselCard> cards = List.of([
    CarouselCard(
      img: 'assets/img/fossickingProhibited.jpg',
      text: 'To uphold and advance the heritage, rights and privileges of individual holders of Miner’s Rights in the State of Victoria to fossick, prospect and mine anywhere in Victoria within the provisions of the Mineral Resources Development Act 1991.',
    ),
    CarouselCard(
      img: 'assets/img/miners-right.jpg',
      text: 'To make submissions to the Crown, Parliament, Members of Parliament, Statutory bodies, Local Government and the like, on matters affecting fossicking, prospecting, mining, and treatment.',
    ),
    CarouselCard(
      img: 'assets/img/mural.jpeg',
      text: 'To assist individual members of the Association to take advantage of the heritage, rights and privileges conferred by the Miner’s Right, and generally to support and advise members.',
    ),
  ]);

  return ListView(
    children: <Widget>[
      Heading(text: 'About PMAV'),
      Text(
        'Established in 1980, the Prospectors and Miners Association of Victoria is a voluntary body created to protect the rights and opportunities of those who wish to prospect, fossick or mine in the State of Victoria, Australia.',
        style: body,
      ),
      Heading(text: 'Primary Aims'),
      CarouselWithIndicator(cards: cards),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const Divider(
              thickness: 2,
            ),
            Text(
              'Whether you are a weekend prospector, small scale miner or interested in preserving your fellow Australians right to access a share of this state’s unlocked, mineral wealth, please join us and keep access to these goldfields open for one and all.',
              style: body,
              textAlign: TextAlign.center,
            ),
            const Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    ],
  );
}
