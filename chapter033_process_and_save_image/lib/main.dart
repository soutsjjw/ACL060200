import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("影像處理"),
    );

    final processedImage = _PickAndProcessImage(GlobalKey<_PickAndProcessImageState>());

    final btn = ElevatedButton(
      child: const Text("選擇影像", style: TextStyle(color: Colors.black, fontSize: 20,),),
      onPressed: () => processedImage.start(),
    );

    final widget = Center(
      child: Column(
        children: [
          Container(child: btn, margin: const EdgeInsets.symmetric(vertical: 30)),
          Container(child: processedImage, margin: const EdgeInsets.symmetric(vertical: 10),),
        ],
      ),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}


class _PickAndProcessImage extends StatefulWidget {
  final GlobalKey<_PickAndProcessImageState> _key;

  const _PickAndProcessImage(this._key) : super(key: _key);

  @override
  _PickAndProcessImageState createState() => _PickAndProcessImageState();

  start() => _key.currentState!.start();
}

class _PickAndProcessImageState extends State<_PickAndProcessImage> {
  String _processedImageFilePath = "";

  @override
  Widget build(BuildContext context) {
    Widget w = _processedImageFilePath.isEmpty ?
        const Text("請選擇一個影像檔", style: TextStyle(fontSize: 20),)
        : Image.file(File(_processedImageFilePath));

    return w;
  }

  start() async {
    var imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile!= null) {
      var tempDir = await getTemporaryDirectory();
      _processedImageFilePath = "${tempDir.path}/processedImage.png";
      File(_processedImageFilePath).writeAsBytesSync(
          await imageFile.readAsBytes());
    }

    setState(() {});
  }
}
