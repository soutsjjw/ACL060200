import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
      title: const Text("挑選照片"),
    );

    final imgPicWrapper =
        _ImagePickerWrapper(GlobalKey<_ImagePickerWrapperState>());

    final btnCameraImage = ElevatedButton(
      child: const Text(
        "相機拍照",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () => imgPicWrapper.getImage(ImageSource.camera),
    );

    final btnGalleryImage = ElevatedButton(
      child: const Text(
        "挑選相簿照片",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () => imgPicWrapper.getImage(ImageSource.gallery),
    );

    final widget = Center(
      child: Column(
        children: [
          Container(
            child: btnCameraImage,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            child: btnGalleryImage,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Expanded(
            child: imgPicWrapper,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _ImagePickerWrapper extends StatefulWidget {
  final GlobalKey<_ImagePickerWrapperState> _key;

  const _ImagePickerWrapper(this._key) : super(key: _key);

  @override
  _ImagePickerWrapperState createState() => _ImagePickerWrapperState();

  getImage(ImageSource imageSource) => _key.currentState?.getImage(imageSource);
}

class _ImagePickerWrapperState extends State<_ImagePickerWrapper> {
  XFile? _imageUrl;

  @override
  Widget build(BuildContext context) {
    final widget = _imageUrl == null
        ? const Text(
            "沒有照片",
            style: TextStyle(fontSize: 20),
          )
        : Image.file(
            File(_imageUrl!.path),
            fit: BoxFit.contain,
          );

    return widget;
  }

  Future<void> getImage(ImageSource imageSource) async {
    var image = await ImagePicker().pickImage(source: imageSource);

    setState(() {
      _imageUrl = image;
    });
  }
}
