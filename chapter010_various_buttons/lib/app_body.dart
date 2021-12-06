import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBody extends StatelessWidget {
  AppBody({Key? key}) : super(key: key);

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    final btn1 = ElevatedButton(
      child: const Text(
        "ElevatedButton",
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.yellow,
        elevation: 8,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      onPressed: () => _showSnackBar("你按下按鈕"),
    );

    final btn2 = TextButton(
      child: const Text(
        "ElevatedButton",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      style: TextButton.styleFrom(
        primary: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      onPressed: () => _showSnackBar("你按下按鈕"),
    );

    final btn3 = OutlinedButton(
      child: const Text(
        "ElevatedButton",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Colors.red,
          style: BorderStyle.solid,
          width: 0.8,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      onPressed: () => _showSnackBar("你按下按鈕"),
    );

    final btn4 = IconButton(
      icon: const Icon(Icons.phone_android),
      iconSize: 40,
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      onPressed: () => _showSnackBar("你按下按鈕"),
    );

    final btn5 = FloatingActionButton(
      child: const Icon(Icons.phone_android),
      elevation: 8,
      shape: const CircleBorder(),
      onPressed: () => _showSnackBar("你按下按鈕"),
    );

    final btn6 = ElevatedButton.icon(
      label: const Text(
        "ElevatedButton.icon",
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ),
      icon: const Icon(Icons.phone_android),
      style: ElevatedButton.styleFrom(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      onPressed: () => _showSnackBar("你按下按鈕"),
    );

    final widget = Center(
      child: Column(
        children: [
          Container(
              child: btn1, margin: const EdgeInsets.symmetric(vertical: 10)),
          Container(
              child: btn2, margin: const EdgeInsets.symmetric(vertical: 10)),
          Container(
              child: btn3, margin: const EdgeInsets.symmetric(vertical: 10)),
          Container(
              child: btn4, margin: const EdgeInsets.symmetric(vertical: 10)),
          Container(
              child: btn5, margin: const EdgeInsets.symmetric(vertical: 10)),
          Container(
              child: btn6, margin: const EdgeInsets.symmetric(vertical: 10)),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );

    return widget;
  }

  void _showSnackBar(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
