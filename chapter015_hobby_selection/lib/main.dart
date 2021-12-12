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
      title: const Text("興趣選擇 App"),
    );

    final text = _TextWidget(GlobalKey<_TextWidgetState>());

    const hobbies = <String>[
      '游泳',
      '唱歌',
      '聽音樂',
      '騎單車',
      '旅遊',
      '美食',
      '運動',
      '籃球',
      '跳舞',
      '棒球',
      '閱讀',
      '寫作'
    ];

    final hobbyCheckboxes =
        _CheckboxList(GlobalKey<_CheckboxListState>(), hobbies);

    final btn = ElevatedButton(
      child: const Text("確定"),
      onPressed: () {
        List hobbyStatus = hobbyCheckboxes.getItemStatus();
        String selectedHobbies = "";
        for (int i = 0; i < hobbyStatus.length; i++) {
          if (hobbyStatus[i]) {
            selectedHobbies += hobbies[i];
          }
        }
        text.setText(selectedHobbies);
      },
    );

    final widget = Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                child: hobbyCheckboxes,
                width: 200,
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
            Container(
              child: btn,
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            Container(
              child: text,
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
          ],
        ),
      ),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _CheckboxList extends StatefulWidget {
  final GlobalKey<_CheckboxListState> _key;
  final List<String> _items;
  late List<bool> _itemStatus;

  _CheckboxList(this._key, this._items) : super(key: _key) {
    _itemStatus = List.generate(_items.length, (i) => false);
  }

  @override
  _CheckboxListState createState() => _CheckboxListState();

  // 取得 Checkbox 選單的勾選狀態
  getItemStatus() => _itemStatus;
}

class _CheckboxListState extends State<_CheckboxList> {
  @override
  Widget build(BuildContext context) {
    var checkboxes = <CheckboxListTile>[];

    // 用 For 迴圈建立 Checkbox 選單
    for (var i = 0; i < widget._items.length; i++) {
      checkboxes.add(CheckboxListTile(
        title: Text(
          widget._items[i],
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        value: widget._itemStatus[i],
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (newValue) {
          setState(() {
            widget._itemStatus[i] = newValue ?? false;
          });
        },
      ));
    }

    // 用 Column 排列 Checkbox 選單
    final w = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: checkboxes,
    );

    return w;
  }
}

class _TextWidget extends StatefulWidget {
  final GlobalKey<_TextWidgetState> _key;

  const _TextWidget(this._key) : super(key: _key);

  @override
  _TextWidgetState createState() => _TextWidgetState();

  setText(String text) {
    _key.currentState!.setText(text);
  }
}

class _TextWidgetState extends State<_TextWidget> {
  String _text = "";

  @override
  Widget build(BuildContext context) {
    final widget = Text(_text, style: const TextStyle(fontSize: 20));
    return widget;
  }

  setText(String text) {
    setState(() {
      _text = text;
    });
  }
}
