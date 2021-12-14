import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '瀏覽影像',
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
      title: const Text("瀏覽影像"),
    );

    const images = <String>['assets/1.png', 'assets/2.png', 'assets/3.png'];

    var imgBrowser = _ImageBrowser(GlobalKey<_ImageBrowserState>(), images);

    final previousBtn = TextButton(
      child: Image.asset("assets/previous.png"),
      onPressed: () {
        imgBrowser.previousImage();
      },);

    final nextBtn = TextButton(
      child: Image.asset("assets/next.png"),
      onPressed: () {
        imgBrowser.nextImage();
      },);

    final widget = Center(
      child: Column(
        children: [
          Container(
            child: imgBrowser,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            child: Row(
              children: [previousBtn, nextBtn,],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _ImageBrowser extends StatefulWidget {
  final GlobalKey<_ImageBrowserState> _key;
  List<String> _images;
  late int _imageIndex;

  _ImageBrowser(this._key, this._images) : super(key: _key) {
    _imageIndex = 0;
  }

  @override
  _ImageBrowserState createState() => _ImageBrowserState();

  previousImage() => _key.currentState!.previousImage();

  nextImage() => _key.currentState!.nextImage();
}

class _ImageBrowserState extends State<_ImageBrowser> {
  @override
  Widget build(BuildContext context) {
    Image img = Image.asset(widget._images[widget._imageIndex]);
    return img;
  }

  previousImage() {
    widget._imageIndex =
    widget._imageIndex == 0 ? widget._images.length - 1 : widget._imageIndex -
        1;
    setState(() {});
  }

  nextImage() {
    widget._imageIndex = ++widget._imageIndex % widget._images.length;
    setState(() {});
  }
}
