import 'package:flutter/material.dart';
import 'package:pmav_flutter/constants/textTheme.dart';

enum CardType { contact, link }

class ContactCard extends StatelessWidget {
  ContactCard(
      {required this.onPressed,
      required this.text,
      required this.subtext,
      required this.icon,
      required this.cardType})
      : super(key: ObjectKey(text));

  final VoidCallback? onPressed;
  final String text;
  final String subtext;
  final CardType cardType;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var body = Theme.of(context).textTheme.bodyText1;
    String buttonText = '';
    switch(cardType) {
      case CardType.contact: {
        buttonText = 'Contact';
      }
      break;
      case CardType.link: {
        buttonText = 'Open';
      }
      break;
    };
    return Card(
      color: const Color.fromRGBO(254, 254, 254, 1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(icon),
            title: Text(text, style: textTheme.bodyText1?.copyWith(fontSize: 20),),
            subtitle: Text(subtext, style: textTheme.bodyText2?.copyWith(fontSize: 15)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text(buttonText, style: textTheme.bodyText1?.copyWith(fontSize: 20)),
                onPressed: onPressed,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
