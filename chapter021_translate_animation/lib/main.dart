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

    const animationWrapper = _AnimationWrapper();

    final widget = Container(
      child: animationWrapper,
      alignment: Alignment.center,
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _AnimationWrapper extends StatefulWidget {
  const _AnimationWrapper({Key? key}) : super(key: key);

  @override
  _AnimationWrapperState createState() => _AnimationWrapperState();
}

class _AnimationWrapperState extends State<_AnimationWrapper>
    with SingleTickerProviderStateMixin {
  late Animation _anim;
  late AnimationController _animCtrl;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _anim = Tween(
      begin: -250.0,
      end: 250.0,
    ).animate(_animCtrl)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animCtrl.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animCtrl.forward();
        }
      });

    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var widget = Transform.translate(
      child: const Text(
        "Flutter 動畫",
        style: TextStyle(fontSize: 30),
      ),
      offset: Offset(0, _anim.value),
    );
    return widget;
  }
}
