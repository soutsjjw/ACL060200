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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("ListView範例"),
    );

    final textWrapper = _TextWrapper(GlobalKey<_TextWrapperState>());

    const items = <String>["第一項", "第二項", "第三項"];
    const icons = <String>["assets/1.png", "assets/2.png", "assets/3.png"];

    var listView = ListView(
      children: ListTile.divideTiles(context: context, tiles: [
        ListTile(
          title: const Text(
            "第一項",
            style: TextStyle(fontSize: 20),
          ),
          onTap: () => textWrapper.setText("點選第一項"),
        ),
        ListTile(
          title: const Text(
            "第二項",
            style: TextStyle(fontSize: 20),
          ),
          onTap: () => textWrapper.setText("點選第二項"),
        ),
        ListTile(
          title: const Text(
            "第三項",
            style: TextStyle(fontSize: 20),
          ),
          onTap: () => textWrapper.setText("點選第三項"),
        ),
      ],).toList(),);

    listView = ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          items[index],
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () => textWrapper.setText("點選${items[index]}"),
      ),
    );

    listView = ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          items[index],
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () => textWrapper.setText("點選${items[index]}"),
        leading: Container(
          child: Image.asset(icons[index],),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        ),
        trailing: const Icon(Icons.keyboard_arrow_right),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );

    listView = ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          items[index],
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () => textWrapper.setText("點選${items[index]}"),
        leading: Container(
          child: CircleAvatar(backgroundImage: AssetImage(icons[index],),),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        ),
        subtitle: const Text("項目說明", style: TextStyle(fontSize: 16),),
        trailing: const Icon(Icons.keyboard_arrow_right),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );

    final widget = Container(
      child: Column(
        children: [
          textWrapper,
          Expanded(
            child: listView,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
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
