import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBody extends StatelessWidget {
  AppBody({Key? key}) : super(key: key);

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    final btn = PopupMenuButton(
      itemBuilder: (context) => const <PopupMenuEntry>[
        PopupMenuItem(
          child: Text("第一項", style: TextStyle(fontSize: 20)),
          value: 1,
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          child: Text("第二項", style: TextStyle(fontSize: 20)),
          value: 2,
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          child: Text("第三項", style: TextStyle(fontSize: 20)),
          value: 3,
        ),// PopupMenuDivider(),
      ],
      color: Colors.yellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      offset: const Offset(120, 30),
      onSelected: (value) => _showSnackBar(value.toString()),
      onCanceled: () => _showSnackBar("取消選擇"),
    );

    final widget = Center(
      child: btn,
      heightFactor: 2,
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
