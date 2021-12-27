import 'dart:math';

import 'package:flutter/material.dart';

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
      title: const Text("動畫範例"),
    );

    final animationWrapper =
        _AnimationWrapper(GlobalKey<_AnimationWrapperState>(), 100);

    var btn = ElevatedButton(
      child: const Text(
        "改變高度",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        animationWrapper.setBarHeight(400);
      },
    );

    final widget = Center(
      child: Container(
        height: 500,
        child: Column(
          children: [
            animationWrapper,
            Container(
              child: btn,
              margin: const EdgeInsets.symmetric(vertical: 20),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
      ),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _AnimationWrapper extends StatefulWidget {
  final GlobalKey<_AnimationWrapperState> _key;
  double _barHeight;

  _AnimationWrapper(this._key, this._barHeight) : super(key: _key);

  @override
  _AnimationWrapperState createState() => _AnimationWrapperState();

  setBarHeight(double height) {
    _key.currentState!.setBarHeight(height);
  }
}

class _AnimationWrapperState extends State<_AnimationWrapper> {
  @override
  Widget build(BuildContext context) {
    var w = AnimatedContainer(
      width: 60.0,
      height: widget._barHeight,
      color: Colors.orangeAccent,
      duration: const Duration(seconds: 1),
    );
    return w;
  }

  setBarHeight(double height) {
    setState(() {
      widget._barHeight = height;
    });
  }
}
