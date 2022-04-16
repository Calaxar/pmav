import 'package:flutter/material.dart';

Widget homePage(context) {
  var body = Theme.of(context).textTheme.bodyText1;
  var bold = body?.copyWith(fontWeight: FontWeight.bold);

  return ListView(
    children: <Widget>[
      const Divider(),
      Text(
        'PMAV Welcome',
        style: Theme.of(context).textTheme.headline1,
      ),
      RichText(
          text: TextSpan(
              text: 'The Prospectors and Miners Association of Victoria',
              style: bold,
              children: const [
            TextSpan(
                text:
                    ' is a voluntary body established to protect and enhance the rights and opportunities of those who wish to prospect, fossick or mine in the State of Victoria, Australia.\n',
                style: TextStyle(fontWeight: FontWeight.normal))
          ])),
      Text(
        'From recreational prospector to smaller scale miner - the PMAV is protecting your interests.  Our membership ranges from prospectors using gold pans, sluices and metal detectors to find gold, gemstones or other minerals, to those using machinery on prospecting licences.\n',
        style: body,
      ),
      Text(
        'Most of the largest gold nuggets ever found were from the central Victorian goldfields, we also enjoy deposits of many other valuable or interesting minerals.\n',
        style: body,
      ),
      Text(
        'Despite this, the Right to conduct these activities in Victoria is constantly under threat from those who seek to abolish the Rights and Privileges won through the stand taken by miners and their supporters at Eureka, Ballarat in 1854.\n',
        style: body,
      ),
      Text(
        'The PMAV will not surrender these Rights or Privileges - we are passionate in our belief that individual prospectors and miners must have fair and reasonable access to a share of this State\'s considerable mineral wealth.\n',
        style: body,
      ),
      Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.black87, width: 3),
                bottom: BorderSide(color: Colors.black87, width: 3))),
        child: const Image(
          image: AssetImage('assets/img/diggers-oath.png'),
        ),
      ),
      const Divider(),
    ],
  );
}
