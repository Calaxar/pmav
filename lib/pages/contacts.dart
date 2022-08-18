import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pmav_flutter/components/contactCard.dart';
import 'package:pmav_flutter/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.black87,
          indicatorColor: flagColor,
          indicatorWeight: 4,
          tabs: const [
            Tab(
              text: 'Contacts',
            ),
            Tab(
              text: 'Links',
            )
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        Expanded(
          child: TabBarView(
            children: [
              ListView(
                children: [
                  ContactCard(
                      onPressed: () async {
                        final Uri emailUri =
                        Uri(scheme: 'mailto', path:'exec@pmav.org.au');
                        if (!await launchUrl(emailUri)) throw 'Could not create email draft';
                      },
                      text: 'PMAV Executive',
                      subtext: 'Email: exec@pmav.org.au',
                      cardType: CardType.contact,
                      icon: Icons.email),
                  ContactCard(
                      onPressed: () async {
                        final Uri phoneUri =
                        Uri(scheme: 'tel', path:'0408176496');
                        if (!await launchUrl(phoneUri)) throw 'Could not call number';
                      },
                      text: 'President',
                      subtext: 'Jason Cornish\nMob: 0408 176 496',
                      cardType: CardType.contact,
                      icon: Icons.account_balance),
                ],
              ),
              ListView(
                children: [
                  ContactCard(
                      onPressed: () async {
                        final Uri uri =
                        Uri.parse('https://pmav.org.au');
                        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) throw 'Could not open link.';
                      },
                      text: 'PMAV Website',
                      subtext: 'https://pmav.org.au',
                      cardType: CardType.link,
                      icon: Icons.launch),
                  ContactCard(
                      onPressed: () async {
                        Uri fbProtocolUrl = Uri.parse('fb://page/731273046931305');
                        final Uri webUri =
                        Uri.parse('https://www.facebook.com/PMAVInc/');
                        try {
                          bool launched = await launchUrl(fbProtocolUrl);
                          if (!launched) {
                            await launchUrl(webUri, mode: LaunchMode.externalApplication);
                          }
                        } catch (e) {
                          await launchUrl(webUri, mode: LaunchMode.externalApplication);
                        }
                      },
                      text: 'PMAV',
                      subtext: 'Facebook Page',
                      cardType: CardType.link,
                      icon: Icons.launch),
                  ContactCard(
                      onPressed: () async {
                        final Uri uri =
                        Uri.parse('https://www.service.vic.gov.au/services/earth-resources');
                        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) throw 'Could not open link.';
                      },
                      text: 'Victorian Miners Right',
                      subtext: 'https://www.service.vic.gov.au/services/earth-resources',
                      cardType: CardType.link,
                      icon: Icons.launch),
                  ContactCard(
                      onPressed: () async {
                        final Uri webUri =
                        Uri.parse('https://www.youtube.com/watch?v=vaZQ_ApA2E0&list=PLixRey9Bslqytri7DKl8-NlsIS5z3wxFy&index=8');
                        try {
                          bool launched = await launchUrl(webUri, mode: LaunchMode.externalNonBrowserApplication);
                          if (!launched) {
                            await launchUrl(webUri);
                          }
                        } catch (e) {
                          await launchUrl(webUri, mode: LaunchMode.externalApplication);
                        }
                      },
                      text: 'Weekend Prospector',
                      subtext: 'Youtube',
                      cardType: CardType.link,
                      icon: Icons.launch),
                  ContactCard(
                      onPressed: () async {
                        final Uri uri =
                        Uri.parse('https://www.vogus-prospecting.com/');
                        if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) throw 'Could not open link.';
                      },
                      text: 'Vo-Gus Prospecting',
                      subtext: 'https://www.vogus-prospecting.com/',
                      cardType: CardType.link,
                      icon: Icons.launch),
                ],
              ),
            ],
            controller: _tabController,
          ),
        ),
      ],
    );
  }
}
