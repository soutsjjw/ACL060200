import 'package:chapter031_save_read_data/share_preferences_util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      title: const Text("Flutter App"),
    );

    final nameController = TextEditingController();
    final nameField = TextField(
      controller: nameController,
      style: const TextStyle(
        fontSize: 20,
      ),
      decoration: const InputDecoration(
        labelText: "輸入姓名",
        labelStyle: TextStyle(fontSize: 20),
      ),
    );

    final btnSave = ElevatedButton(
      child: const Text("儲存"),
      onPressed: () => SharePreferencesUtil().setName(nameController.text),
    );

    final displayName = _DisplayName(GlobalKey<_DisplayNameState>());

    final btnRead = ElevatedButton(
      child: const Text("讀取"),
      onPressed: () => displayName.display(),
    );

    final widget = Center(
      child: Column(
        children: [
          Container(
            child: nameField,
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            child: btnSave,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            child: btnRead,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            child: displayName,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _DisplayName extends StatefulWidget {
  final GlobalKey<_DisplayNameState> _key;
  String? _name = "";

  _DisplayName(this._key) : super(key: _key);

  @override
  _DisplayNameState createState() => _DisplayNameState();

  display() async {
    _name = await SharePreferencesUtil().getName();
    _key.currentState!.rebuild();
  }
}

class _DisplayNameState extends State<_DisplayName> {
  @override
  Widget build(BuildContext context) {
    final w = Text(
      widget._name ?? "",
      style: const TextStyle(
        fontSize: 20,
      ),
    );

    return w;
  }

  rebuild() => setState(() {});
}
