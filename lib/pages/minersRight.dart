import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pmav_flutter/components/button.dart';
import 'package:pmav_flutter/components/heading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/strings.dart';

class MinersRight extends StatefulWidget {
  const MinersRight({Key? key}) : super(key: key);

  @override
  _MinersRightState createState() => _MinersRightState();
}

class _MinersRightState extends State<MinersRight> {
  String _filePath = "";
  bool _showPDF = false;
  Orientation _lastScreenOrientation = Orientation.portrait;
  UniqueKey pdfViewerKey = UniqueKey();
  int currPage = 0;
  int totalPages = 0;

  SnackBar fileNotFound = const SnackBar(
    content: Text('File not found. Try updating the shortcut.'),
  );

  SnackBar fileNotUpdated = const SnackBar(
    content: Text('Error: Shortcut couldn\'t be updated.'),
  );

  SnackBar fileUpdated(String fileName) => SnackBar(
    content: Text('Shortcut updated to open $fileName.'),
  );

  pickFile() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    final prefs = await SharedPreferences.getInstance();
    if (result?.files[0] != null) {
      await prefs.setString(MINERS_RIGHT_PATH_KEY, result!.files[0].path!);
      ScaffoldMessenger.of(context).showSnackBar(fileUpdated(result.files[0].name));
    }
  }

  showFile() async {
    final prefs = await SharedPreferences.getInstance();
    final path = await prefs.getString(MINERS_RIGHT_PATH_KEY);
    if(path != null) {
      setState(() {
        _filePath = path;
        _showPDF = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(fileNotFound);
    }
  }

  @override
  Widget build(BuildContext context) {
    var body = Theme.of(context).textTheme.bodyText1;

    if (_showPDF) {
      return OrientationBuilder(
        builder: (ctx, ori) {
          Orientation newOrientation = MediaQuery.of(context).orientation;
          if (_lastScreenOrientation != null &&
              _lastScreenOrientation != newOrientation) {
            Future.delayed(Duration(microseconds: 100), () {
              setState(() {
                _lastScreenOrientation = newOrientation;
                pdfViewerKey = UniqueKey();
              });
            });
          }
          return PDFView(
            key: pdfViewerKey,
            filePath: _filePath,
            onPageChanged: (page, total) {
              setState(() {
                currPage = page!;
                totalPages = total!;
              });
            },
            onViewCreated: (controller) {
              if (currPage != null) controller.setPage(currPage);
            },
          );
        },
      );
    } else {
      return ListView(
      children: <Widget>[
        Heading(text: 'Miner\'s Right'),
        Text(
          'If you download your Miner\'s Right as a pdf onto this device, you can set up a shortcut to the file here so that you can easily access and display it.',
          style: body,
        ),
        StyledButton(onPressed: showFile, text: 'Show Right'),
        StyledButtonAlt(onPressed: pickFile, text: 'Update Shortcut'),
      ],
    );
    }
  }
}
