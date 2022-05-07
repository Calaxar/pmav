import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pmav_flutter/components/button.dart';
import 'package:pmav_flutter/components/heading.dart';
import 'dart:developer' as developer;

class MinersRight extends StatefulWidget {
  const MinersRight({Key? key}) : super(key: key);

  @override
  _MinersRightState createState() => _MinersRightState();
}

class _MinersRightState extends State<MinersRight> {
  PlatformFile? _file;

  pickFile() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    setState(() {
      if(result?.files[0] != null) {
        _file = result?.files[0];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var body = Theme.of(context).textTheme.bodyText1;

    return ListView(
      children: <Widget>[
        Heading(text: 'Miner\'s Right'),
        Text(
          'If you download your Miner\'s Right as a pdf onto this device, you can set up a shortcut to the file here so that you can easily access and display it.',
          style: body,
        ),
        Text(
          _file?.name ?? 'file name',
          style: body,
        ),
        StyledButton(
          onPressed: () {},
          text: 'Show Certificate',
        ),
        StyledButtonAlt(onPressed: pickFile, text: 'Change Shortcut')
      ],
    );
  }
}
