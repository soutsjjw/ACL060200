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
      title: const Text("ListView範例"),
    );

    var items = <String>["1", "2", "3"];
    var itemLastNum = items.length;
    final GlobalKey<AnimatedListState> itemMenuKey = GlobalKey();

    final animList = AnimatedList(
      key: itemMenuKey,
      initialItemCount: items.length,
      itemBuilder: (context, index, animation) => SizeTransition(
        sizeFactor: animation,
        child: ListTile(
          title: Text(items[index], style: const TextStyle(fontSize: 20),),
          onTap: () {
            items.add((++itemLastNum).toString());
            itemMenuKey.currentState?.insertItem(items.length - 1);
          },
          onLongPress: () {
            var removedItem = items.removeAt(index);
            itemMenuKey.currentState?.removeItem(index, (context, animation) => SizeTransition(
              sizeFactor: animation,
              child: ListTile(
                title: Text(
                  removedItem,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),);
          },
        ),
      ),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: animList,
    );

    return appHomePage;
  }
}

class _ItemMenu extends StatefulWidget {
  const _ItemMenu({Key? key}) : super(key: key);

  @override
  _ItemMenuState createState() => _ItemMenuState();
}

class _ItemMenuState extends State<_ItemMenu> {
  final _items = <String>["1", "2", "3"];

  @override
  Widget build(BuildContext context) {
    final Widget widget = ListView.separated(
      itemCount: _items.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(_items[index], style: const TextStyle(fontSize: 20),),
        onTap: () => setState(() {
          _items.add((_items.length + 1).toString());
        }),
        onLongPress: () => setState(() {
          _items.removeAt(index);
        }),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );

    return widget;
  }
}
