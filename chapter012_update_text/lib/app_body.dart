import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  AppBody({Key? key}) : super(key: key);

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

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

    final nameWidget = _NameWidget(GlobalKey<_NameWidgetState>());

    final btn = ElevatedButton(
      child: const Text("確定"),
      onPressed: () => nameWidget.setName(nameController.text),
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
            child: btn,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            child: nameWidget,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    );

    return widget;
  }

  void _showSnackBar(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class _NameWidget extends StatefulWidget {
  _NameWidget(this._key) : super(key: _key);

  final GlobalKey<_NameWidgetState> _key;

  @override
  _NameWidgetState createState() => _NameWidgetState();

  setName(String name) {
    _key.currentState!.setName(name);
  }
}

class _NameWidgetState extends State<_NameWidget> {
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return Text(_name, style: const TextStyle(fontSize: 20),);
  }

  setName(String name) {
    setState(() {
      _name = name;
    });
  }
}
