import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:permission_handler/permission_handler.dart';

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

    final multiImgPickerWrapper =
        _MultiImagePickerWrapper(GlobalKey<_MultiImagePickerWrapperState>());

    final btnPickImages = ElevatedButton(
      child: const Text(
        "挑選多張照片",
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
      onPressed: () => multiImgPickerWrapper.selectImages(),
    );

    final widget = Center(
      child: Column(
        children: [
          Container(
            child: btnPickImages,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Expanded(
            child: multiImgPickerWrapper,
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

class _MultiImagePickerWrapper extends StatefulWidget {
  final GlobalKey<_MultiImagePickerWrapperState> _key;

  const _MultiImagePickerWrapper(this._key) : super(key: _key);

  @override
  _MultiImagePickerWrapperState createState() =>
      _MultiImagePickerWrapperState();

  selectImages() => _key.currentState?.selectImages();
}

class _MultiImagePickerWrapperState extends State<_MultiImagePickerWrapper> {
  List<Asset>? _selectedImages;

  @override
  Widget build(BuildContext context) {
    if (_selectedImages == null || _selectedImages!.isEmpty) {
      return const Text("沒有照片", style: TextStyle(fontSize: 20));
    } else {
      final gridview = GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        physics: const BouncingScrollPhysics(),
        children: List.generate(_selectedImages!.length, (index) {
          var asset = _selectedImages![index];
          final assetThumb = AssetThumb(
            asset: asset,
            width: 300,
            height: 300,
          );
          return assetThumb;
        }),
      );
      return gridview;
    }
  }

  Future<void> selectImages() async {
    List<Asset>? selectedImages;
    try {
      if (await Permission.camera.isGranted == false) {
        await [Permission.camera].request();
      }
      if (await Permission.storage.isGranted) {
        // TODO：使用相機會有「Permission denied」錯誤
        selectedImages = await MultiImagePicker.pickImages(
          maxImages: 10,
          enableCamera: true,
        );
      }
    } on NoImagesSelectedException {
      const snackBar = SnackBar(
        content: Text("沒有挑選照片"),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      const snackBar = SnackBar(
        content: Text("挑選照片失敗"),
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    setState(() {
      _selectedImages = selectedImages;
    });
  }
}