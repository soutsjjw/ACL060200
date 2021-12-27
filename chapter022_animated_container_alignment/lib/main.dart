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

    final animationWrapper = _AnimationWrapper(
        GlobalKey<_AnimationWrapperState>(), Alignment.bottomCenter);

    var btn = ElevatedButton.icon(
      icon: const Padding(
        padding: EdgeInsets.only(left: 20, top: 10, right: 0, bottom: 10),
        child: Icon(Icons.airplanemode_active, color: Colors.white),
      ),
      label: const Padding(
        padding: EdgeInsets.only(left: 0, top: 10, right: 20, bottom: 10),
        child: Text("起飛", style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        animationWrapper.setAlignment(Alignment.topCenter);
      },
    );

    final widget = Center(
      child: SizedBox(
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
  Alignment _alignment;

  _AnimationWrapper(this._key, this._alignment) : super(key: _key);

  @override
  _AnimationWrapperState createState() => _AnimationWrapperState();

  setAlignment(Alignment alignment) {
    _key.currentState!.setAlignment(alignment);
  }
}

class _AnimationWrapperState extends State<_AnimationWrapper> {
  @override
  Widget build(BuildContext context) {
    var w = Expanded(
      child: AnimatedContainer(
        duration: const Duration(seconds: 3),
        curve: Curves.fastOutSlowIn,
        child: const Icon(
          Icons.airplanemode_active,
          color: Colors.lightBlue,
          size: 50,
        ),
        alignment: widget._alignment,
        onEnd: () {
          setState(() {
            widget._alignment = Alignment.bottomCenter;
          });
        },
      ),
    );
    return w;
  }

  setAlignment(Alignment alignment) {
    setState(() {
      widget._alignment = alignment;
    });
  }
}
