import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTitle = const Text("Flutter App");

    var appBody = const AppBody();

    var appBar = AppBar(
      title: appTitle,
    );

    var app = MaterialApp(
      home: Scaffold(
        appBar: appBar,
        body: appBody,
      ),
    );

    return app;
  }
}

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = Container(
      child: ElevatedButton(
        child: Text(
          "顯示 SnackBar 訊息",
          style: TextStyle(
            fontSize: 20,
            color: Colors.red[500],
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          elevation: 8,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        onPressed: () {
          final snackBar = SnackBar(
            content: Text("你按下按鈕"),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            action: SnackBarAction(
              label: "Toast 訊息",
              textColor: Colors.white,
              onPressed: () => Fluttertoast.showToast(
                msg: "你按下 SnackBar",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 20.0,
              ),
            ),
          );

          // Scaffold.of(context).showSnackBar(snackBar);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(30),
    );

    return widget;
  }
}
