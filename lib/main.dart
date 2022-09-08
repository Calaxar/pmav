import 'package:flutter/material.dart';
import 'package:pmav_flutter/constants/textTheme.dart';
import 'package:pmav_flutter/pages/contacts.dart';
import 'package:pmav_flutter/pages/gettingStarted.dart';
import 'package:pmav_flutter/pages/minersRight.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants/colors.dart';
import 'pages/aboutPMAV.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: MaterialColor(flagColor.value, swatch),
          textTheme: textTheme),
      home: const MyHomePage(title: 'PMAV'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget? page;
  final GlobalKey<ScaffoldState> _drawerScaffoldKey =
      GlobalKey<ScaffoldState>();

  Widget pmavListTile(String text, Widget widget, [Icon? icon]) {
    return Column(
      children: <Widget>[
        const Divider(color: Colors.black45, indent: 15, endIndent: 15),
        ListTile(
          title: Text(
            text,
            style: const TextStyle(color: Colors.black87, fontSize: 24),
          ),
          onTap: () {
            setState(() {
              page = widget;
            });
            Navigator.pop(context);
          },
          trailing: Padding(
            padding: EdgeInsets.only(right: 20),
            child: icon,
          ),
        ),
      ],
    );
  }

  Widget pmavLinkTile(String text, String ref, [Icon? icon]) {
    return Column(
      children: <Widget>[
        const Divider(color: Colors.black45, indent: 15, endIndent: 15),
        ListTile(
          title: Text(
            text,
            style: const TextStyle(color: Colors.black87, fontSize: 24),
          ),
          onTap: () async {
            final Uri uri =
            Uri.parse(ref);
            if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) throw 'Could not open link.';
          },
          trailing: Padding(
            padding: EdgeInsets.only(right: 20),
            child: icon,
          ),
        ),
      ],
    );
  }

  Widget pmavDrawer() {
    return Drawer(
      child: Container(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: const Image(
                    image: AssetImage('assets/img/PMAV-logo-trans.png')),
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/sideDrawerHeader.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            pmavListTile('About PMAV', aboutPMAV(context)),
            pmavListTile('Getting Started', gettingStarted(context)),
            pmavListTile('Links & Contacts', const Contacts()),
            pmavListTile('Miner\'s Right', const MinersRight()),
            pmavLinkTile(
                'Join PMAV',
                'https://pmav.org.au/join-pmav/',
                const Icon(
                  Icons.open_in_new,
                  color: Colors.black87,
                  size: 35,
                )),
            const Divider(color: Colors.black45, indent: 15, endIndent: 15),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    page ??= aboutPMAV(context);
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white, size: 35),
          leading: IconButton(
            onPressed: () {
              //on drawer menu pressed
              if (_drawerScaffoldKey.currentState!.isDrawerOpen) {
                //if drawer is open, then close the drawer
                Navigator.pop(context);
              } else {
                _drawerScaffoldKey.currentState?.openDrawer();
                //if drawer is closed then open the drawer.
              }
            },
            icon: Icon(Icons.menu),
          ),
        ),
        body: Scaffold(
          drawer: pmavDrawer(),
          key: _drawerScaffoldKey,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/bushes.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              decoration: const BoxDecoration(color: Colors.white),
              child: page,
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
