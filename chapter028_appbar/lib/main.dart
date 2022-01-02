import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawer = Drawer(
      child: ListView(
        children: <Widget> [
          const DrawerHeader(
            child: Text('Drawer標題', style: TextStyle(fontSize: 20),),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
              title: const Text('選項一', style: TextStyle(fontSize: 20),),
              onTap: () {
                Fluttertoast.showToast(
                    msg: '選項一',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black,
                    textColor: Colors.white);
                Navigator.pop(context);
              }
          ),
          ListTile(
              title: const Text('選項二', style: TextStyle(fontSize: 20),),
              onTap: () {
                Fluttertoast.showToast(
                    msg: '選項二',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black,
                    textColor: Colors.white);
                Navigator.pop(context);
              }
          ),
          ListTile(
              title: const Text('選項三', style: TextStyle(fontSize: 20),),
              onTap: () {
                Fluttertoast.showToast(
                    msg: '選項三',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black,
                    textColor: Colors.white);
                Navigator.pop(context);
              }
          ),
        ],
      ),
    );

    final appBar = AppBar(
      title: const Text("AppBar範例"),
      // centerTitle: true,
      // backgroundColor: Colors.orange,
      // elevation: 10,
      // systemOverlayStyle: SystemUiOverlayStyle.light,
      // leading: InkWell(
      //   child: const Icon(Icons.menu),
      //   onTap: () {
      //     Fluttertoast.showToast(
      //       msg: "你按下選單按鈕",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.BOTTOM,
      //       backgroundColor: Colors.black,
      //       textColor: Colors.white,
      //     );
      //   },
      // ),
      // automaticallyImplyLeading: false,
    );

    final page = Scaffold(
      appBar: appBar,
      drawer: drawer,
    );

    return page;
  }
}
