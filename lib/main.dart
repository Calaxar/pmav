import 'package:flutter/material.dart';

import 'pages/homePage.dart';

const FLAG_COLOR = Color.fromRGBO(0, 84, 163, 1);
const PRIMARY_COLOR = Color.fromRGBO(20, 20, 20, 1);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> swatch = {
      50:  const Color(0xffe1f5ff),//10%
      100: const Color(0xffb2e4ff),//20%
      200: const Color(0xff7ed3ff),//30%
      300: const Color(0xff47c2ff),//40%
      400: const Color(0xff15b4ff),//50%
      500: const Color(0xff00a7fd),//60%
      600: const Color(0xff0099ee),//70%
      700: const Color(0xff0086d9),//80%
      800: const Color(0xff0075c5),//90%
      900: const Color(0xff0054a3),//100%
    };
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: MaterialColor(FLAG_COLOR.value, swatch),
          textTheme: const TextTheme(
              headline1: TextStyle(color: FLAG_COLOR, fontSize: 40),
              subtitle2: TextStyle(color: FLAG_COLOR),
              subtitle1: TextStyle(color: FLAG_COLOR),
              bodyText1: TextStyle(fontSize: 17))),
      home: const MyHomePage(title: 'PMAV'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key, required this.title}) : super(key: key);

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
  Widget pmavListTile(String text, Widget widget, [Icon? icon]) {
    return Column(
      children: <Widget>[
        const Divider(color: Colors.black45,
          indent: 15,
          endIndent: 15),
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
          trailing: Padding(padding: EdgeInsets.only(right: 20), child: icon,),
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
                child:
                const Image(image: AssetImage('assets/img/PMAV-logo-trans.png')),
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/sideDrawerHeader.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            pmavListTile('About PMAV', homePage(context)),
            pmavListTile('Getting Started', homePage(context)),
            pmavListTile('Links & Contacts', homePage(context)),
            pmavListTile('Miner\'s Right', homePage(context)),
            pmavListTile('Join PMAV', homePage(context), const Icon(Icons.open_in_new, color: Colors.black87, size: 35,)),
            const Divider(color: Colors.black45,
                indent: 15,
                endIndent: 15),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    page ??= homePage(context);
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: pmavDrawer(),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/bushes.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
            decoration: const BoxDecoration(color: Colors.white),
            child: page,
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
