import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:progress_indicators/progress_indicators.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("Flutter App"),
    );

    final btnLinear = ElevatedButton(
      child: const Text(
        "開始(Linear)",
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () => _startProgress(context, ProgressType.linear),
    );

    final btnCircular = ElevatedButton(
      child: const Text(
        "開始(Circular)",
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () => _startProgress(context, ProgressType.circular),
    );

    final btnLinearPercent = ElevatedButton(
      child: const Text(
        "開始(LinearPercent)",
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () => _startProgress(context, ProgressType.linearPercent),
    );

    final btnCircularPercent = ElevatedButton(
      child: const Text(
        "開始(CircularPercent)",
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () => _startProgress(context, ProgressType.circularPercent),
    );

    final btnJumpText = ElevatedButton(
      child: const Text(
        "開始(JumpText)",
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () => _startProgress(context, ProgressType.jumpText),
    );

    final btnFadingText = ElevatedButton(
      child: const Text(
        "開始(FadingText)",
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () => _startProgress(context, ProgressType.fadingText),
    );

    final btnScalingText = ElevatedButton(
      child: const Text(
        "開始(ScalingText)",
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () => _startProgress(context, ProgressType.scalingText),
    );

    final widget = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          btnLinear,
          btnCircular,
          btnLinearPercent,
          btnCircularPercent,
          btnJumpText,
          btnFadingText,
          btnScalingText
        ],
      ),
      heightFactor: 3,
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }

  _startProgress(BuildContext context, ProgressType progressType) {
    var progress = 0.0;

    final linearProgress = _LinearProgress(GlobalKey<_LinearProgressState>());
    final circularProgress =
        _CircularProgress(GlobalKey<_CircularProgressState>());
    final linearPercent = _LinearPercent(GlobalKey<_LinearPercentState>());
    final circularPercent =
        _CircularPercent(GlobalKey<_CircularPercentState>());
    final jumpText = JumpingText(
      "處理中...",
      style: const TextStyle(fontSize: 24, color: Colors.teal),
    );
    final fadingText = FadingText(
      "處理中...",
      style: const TextStyle(fontSize: 24, color: Colors.teal),
    );
    final scalingText = ScalingText(
      "處理中...",
      style: const TextStyle(fontSize: 24, color: Colors.teal),
    );
    Widget? widget;

    switch (progressType) {
      case ProgressType.linear:
        widget = Container(
          child: SizedBox(child: linearProgress, width: 180, height: 8),
          width: 200,
          height: 100,
          alignment: Alignment.center,
        );
        break;
      case ProgressType.circular:
        widget = Container(
          child: SizedBox(child: circularProgress, width: 100, height: 100),
          width: 200,
          height: 200,
          alignment: Alignment.center,
        );
        break;
      case ProgressType.linearPercent:
        widget = Container(
          child: linearPercent,
          width: 350,
          height: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        );
        break;
      case ProgressType.circularPercent:
        widget = Container(
          child: circularPercent,
          width: 150,
          height: 150,
          alignment: Alignment.center,
        );
        break;
      case ProgressType.jumpText:
        widget = Container(
          child: jumpText,
          width: 200,
          height: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        );
        break;
      case ProgressType.fadingText:
        widget = Container(
          child: fadingText,
          width: 200,
          height: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        );
        break;
      case ProgressType.scalingText:
        widget = Container(
          child: scalingText,
          width: 200,
          height: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        );
        break;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setState) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
              child: widget,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          );
        },
      ),
    );

    Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        if (progress >= 1) {
          Navigator.pop(context);
          timer.cancel();
        } else {
          progress += 0.1;

          switch (progressType) {
            case ProgressType.linear:
              linearProgress.setProgress(progress);
              break;
            case ProgressType.circular:
              circularProgress.setProgress(progress);
              break;
            case ProgressType.linearPercent:
              linearPercent.setProgress(progress);
              break;
            case ProgressType.circularPercent:
              circularPercent.setProgress(progress);
              break;
          }
        }
      },
    );
  }
}

//region _LinearProgress

class _LinearProgress extends StatefulWidget {
  final GlobalKey<_LinearProgressState> _key;
  var progress = 0.0;

  _LinearProgress(this._key) : super(key: _key);

  @override
  _LinearProgressState createState() => _LinearProgressState();

  setProgress(double progress) {
    this.progress = progress >= 1 ? 1 : progress;
    _key.currentState!.rebuild();
  }
}

class _LinearProgressState extends State<_LinearProgress> {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: widget.progress,
      backgroundColor: Colors.yellow,
      valueColor: const AlwaysStoppedAnimation(Colors.deepOrange),
    );
  }

  rebuild() => setState(() {});
}

//endregion

//region _CircularProgress

class _CircularProgress extends StatefulWidget {
  final GlobalKey<_CircularProgressState> _key;
  var progress = 0.0;

  _CircularProgress(this._key) : super(key: _key);

  @override
  _CircularProgressState createState() => _CircularProgressState();

  setProgress(double progress) {
    this.progress = progress >= 1 ? 1 : progress;
    _key.currentState!.rebuild();
  }
}

class _CircularProgressState extends State<_CircularProgress> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: widget.progress,
      backgroundColor: Colors.black26,
      valueColor: const AlwaysStoppedAnimation(Colors.deepPurple),
      strokeWidth: 8,
    );
  }

  rebuild() => setState(() {});
}

//endregion

//region _LinearPercent

class _LinearPercent extends StatefulWidget {
  final GlobalKey<_LinearPercentState> _key;
  var progress = 0.0;

  _LinearPercent(this._key) : super(key: _key);

  @override
  _LinearPercentState createState() => _LinearPercentState();

  setProgress(double progress) {
    this.progress = progress >= 1 ? 1 : progress;
    _key.currentState!.rebuild();
  }
}

class _LinearPercentState extends State<_LinearPercent> {
  @override
  Widget build(BuildContext context) {
    var percent = (widget.progress * 100).toStringAsFixed(0);

    return LinearPercentIndicator(
      lineHeight: 20.0,
      percent: widget.progress,
      center: Text(
        "$percent%",
        style: const TextStyle(fontSize: 18, color: Colors.yellow),
      ),
      leading: const Text(
        "0%",
        style: TextStyle(fontSize: 18, color: Colors.blue),
      ),
      trailing: const Text(
        "100%",
        style: TextStyle(fontSize: 18, color: Colors.blue),
      ),
      progressColor: Colors.green,
    );
  }

  rebuild() => setState(() {});
}

//endregion

//region _CircularPercent

class _CircularPercent extends StatefulWidget {
  final GlobalKey<_CircularPercentState> _key;
  var progress = 0.0;

  _CircularPercent(this._key) : super(key: _key);

  @override
  _CircularPercentState createState() => _CircularPercentState();

  setProgress(double progress) {
    this.progress = progress >= 1 ? 1 : progress;
    _key.currentState!.rebuild();
  }
}

class _CircularPercentState extends State<_CircularPercent> {
  @override
  Widget build(BuildContext context) {
    var percent = (widget.progress * 100).toStringAsFixed(0);

    return CircularPercentIndicator(
      radius: 100.0,
      lineWidth: 8.0,
      percent: widget.progress,
      center: Text(
        "$percent%",
        style: const TextStyle(fontSize: 24, color: Colors.blue),
      ),
      progressColor: Colors.green,
    );
  }

  rebuild() => setState(() {});
}

//endregion

enum ProgressType {
  linear,
  circular,
  linearPercent,
  circularPercent,
  jumpText,
  fadingText,
  scalingText,
}
