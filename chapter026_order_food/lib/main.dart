import 'package:chapter026_order_food/select_drink.dart';
import 'package:chapter026_order_food/select_main_course.dart';
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
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(),
        "/select main course": (context) => SelectMainCourse(),
        "/select drink": (context) => SelectDrink(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("點餐"),
    );

    final mainCourse = _TextWrapper(GlobalKey<_TextWrapperState>());
    final drink = _TextWrapper(GlobalKey<_TextWrapperState>());

    final btnSelectMainCourse = ElevatedButton(
      child: Text(
        "選擇主餐",
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
      onPressed: () => _showMainCourseScreen(context, mainCourse),
    );

    final btnSelectDrink = ElevatedButton(
      child: Text(
        "選擇飲料",
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
      onPressed: () => _showDrinkScreen(context, drink),
    );

    final row1 = Row(
      children: [
        Expanded(
          child: Container(
            child: mainCourse,
            margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          ),
        ),
        Container(
          child: btnSelectMainCourse,
          margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
        ),
      ],
    );

    final row2 = Row(
      children: [
        Expanded(
          child: Container(
            child: drink,
            margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          ),
        ),
        Container(
          child: btnSelectDrink,
          margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
        ),
      ],
    );

    final widget = Column(
      children: [
        row1, row2,
      ],
    );

    final page = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return page;
  }

  _showMainCourseScreen(BuildContext context, _TextWrapper textWrapper) async {
    final result = await Navigator.pushNamed(context, "/select main course",);

    if (result != null) {
      textWrapper.setText(result.toString());
    } else {
      textWrapper.setText("沒有選擇");
    }
  }

  _showDrinkScreen(BuildContext context, _TextWrapper textWrapper) async {
    final result = await Navigator.pushNamed(context, "/select drink",);

    if (result != null) {
      textWrapper.setText(result.toString());
    } else {
      textWrapper.setText("沒有選擇");
    }
  }
}

class _TextWrapper extends StatefulWidget {
  final GlobalKey<_TextWrapperState> _key;

  const _TextWrapper(this._key) : super(key: _key);

  @override
  _TextWrapperState createState() => _TextWrapperState();

  setText(String string) {
    _key.currentState?.setText(string);
  }
}

class _TextWrapperState extends State<_TextWrapper> {
  String _str = "";

  @override
  Widget build(BuildContext context) {
    var widget = Text(
      _str,
      style: const TextStyle(fontSize: 20),
    );

    return widget;
  }

  setText(String string) {
    setState(() {
      _str = string;
    });
  }
}
