import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pmav_flutter/components/heading.dart';
import 'package:pmav_flutter/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

Widget gettingStarted(context) {
  var body = Theme.of(context).textTheme.bodyText1;
  var link = Theme.of(context).textTheme.bodyText1?.copyWith(
      color: linkColor,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold);

  final Uri _verUrl =
      Uri.parse('https://www.service.vic.gov.au/services/earth-resources');
  _launchVerUrl() async {
    if (!await launchUrl(_verUrl)) throw 'Could not launch $_verUrl';
  }

  Widget paragraph({required Widget child}) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: child,
      );

  Widget styledExpandedTile(
          {required String title, required List<Widget> children}) =>
      ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 18),
        children: children,
      );

  return DefaultTextStyle(
    style: body!,
    child: ListView(
      children: <Widget>[
        Heading(text: 'Getting Started'),
        paragraph(
          child: RichText(
              text: TextSpan(
            style: body,
            text: 'Before you can prospect in Victoria, you must obtain a ',
            children: const <TextSpan>[
              TextSpan(
                  text: 'Miners Right',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '.'),
            ],
          )),
        ),
        paragraph(
          child: const Text(
              'The Miners Right allows the holder to search for, and take possession of, any mineral located on many areas of public land, or, on private land with the landholder’s prior consent.'),
        ),
        paragraph(
          child: RichText(
              text: TextSpan(
            style: body,
            text: 'This is available through the ',
            children: <TextSpan>[
              TextSpan(
                  text: 'Victorian Earth Resources',
                  style: link,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      _launchVerUrl();
                    }),
              const TextSpan(
                  text:
                      ' site, or selected tourist information centres and prospecting equipment supply shops in Victoria.'),
            ],
          )),
        ),
        paragraph(
          child: const Text(
              'Children under 18 years old do not need a Miner’s Right while prospecting if they are accompanied by an adult who holds a current Miner’s Right.'),
        ),
        Heading(text: 'Equipment'),
        styledExpandedTile(title: 'Metal Detector', children: [
          paragraph(
            child: const Text(
                'A handheld electronic device which detects the presence of metal nearby, used by sweeping it over the ground or other objects.'),
          ),
          Text(
            'Very Low Frequency',
            style: body.copyWith(fontWeight: FontWeight.bold),
          ),
          paragraph(
              child: const Text(
            'Type (VLF) is the simplest type but restricted in its use and ability to ‘punch’ deep.',
          )),
          Text(
            'Pulse Induction (PI)',
            style: body.copyWith(fontWeight: FontWeight.bold),
          ),
          paragraph(
              child: const Text(
            'Most versatile, designed for Australian conditions and powerful... BUT expensive',
          )),
        ]),
        styledExpandedTile(title: 'Panning', children: [
          paragraph(
            child: const Text(
                'A simple method of separating heavier gold from lighter soil or gravel by washing it in a pan with water.'),
          ),
        ]),
        styledExpandedTile(title: 'Sluice', children: [
          paragraph(
            child: const Text(
                'A channel with riffles along the bottom, designed to trap gold from soil or gravel as it is washed through the channel with water. Gold sluice boxes can be operated using running creek/river water, or can have water supplied with a pump.'),
          ),
        ]),
        styledExpandedTile(title: 'Trommel', children: [
          paragraph(
            child: const Text(
                'A mechanical tool used to separate large rocks from finer gravel or soil. Gold bearing material is added to a hopper. It is washed with water into a rotating drum, where the water and rotation breaks up any lumps. The rotating drum is constructed of a screen material – large rocks are discarded while the finer material is directed into a sluice box.'),
          ),
        ]),
        Heading(text: 'Where To Go'),
        paragraph(
            child: const Text(
                'Prospecting is allowed in most State Forests, many Reserves and private property with the land owner’s permission.')),
        paragraph(
            child: const Text(
                'Prospecting is also permitted on Crown Land (except for Prohibited Crown Land), and permitted areas in certain parks under the National Parks Act.')),
      ],
    ),
  );
}
