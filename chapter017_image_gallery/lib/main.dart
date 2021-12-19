import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

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

    const images = <String>["assets/1.png", "assets/2.png", "assets/3.png"];

    final gallery = _PhotoViewGalleryWrapper(
      GlobalKey<_PhotoViewGalleryWrapperState>(),
      images,
      const BoxDecoration(
        color: Colors.white,
      ),
      0,
      0.6,
      1.2,
      Axis.horizontal,
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: gallery,
    );

    return appHomePage;
  }
}

class _PhotoViewGalleryWrapper extends StatefulWidget {
  final GlobalKey<_PhotoViewGalleryWrapperState> _key;
  late final List<String> _images;
  late final BoxDecoration _backgroundDecoration;
  late final int _initialIndex;
  late final double _minScale;
  late final double _maxScale;
  late final Axis _scrollDirection;
  late int _imageIndex;

  _PhotoViewGalleryWrapper(this._key, this._images, this._backgroundDecoration,
      this._initialIndex, this._minScale, this._maxScale, this._scrollDirection)
      : super(key: _key) {
    _imageIndex = _initialIndex;
  }

  @override
  _PhotoViewGalleryWrapperState createState() =>
      _PhotoViewGalleryWrapperState();
}

class _PhotoViewGalleryWrapperState extends State<_PhotoViewGalleryWrapper> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: _buildItem,
          itemCount: widget._images.length,
          enableRotation: true,
          backgroundDecoration: widget._backgroundDecoration,
          pageController: PageController(initialPage: widget._initialIndex),
          onPageChanged: _onPageChanged,
          scrollDirection: widget._scrollDirection,
        ),
        Container(
          margin: const EdgeInsets.all(50.0),
          child: Text("Image ${widget._imageIndex + 1}",
              style: const TextStyle(fontSize: 20)),
        ),
      ],
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return PhotoViewGalleryPageOptions(
      imageProvider: AssetImage(widget._images[index]),
      initialScale: PhotoViewComputedScale.contained,
      minScale: widget._minScale,
      maxScale: widget._maxScale,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      widget._imageIndex = index;
    });
  }
}
