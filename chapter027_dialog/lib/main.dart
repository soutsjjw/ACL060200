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
    final appBar = AppBar(
      title: const Text("對話盒範例"),
    );

    var btn = ElevatedButton(
      child: const Text(
        "顯示對話盒",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () => _showDialog(context),
    );

    var btn2 = ElevatedButton(
      child: const Text(
        "顯示對話盒2",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () async {
        var ans = await _showDialog2(context);
        print(ans);
      },
    );

    var btn3 = ElevatedButton(
      child: const Text(
        "顯示對話盒3",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () async {
        var ans = await _showDialog3(context);
        print(ans);
      },
    );

    var btn4 = ElevatedButton(
      child: const Text(
        "顯示對話盒4",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () async {
        var ans = await _showDialog4(context);
        print(ans);
      },
    );

    var btn5 = ElevatedButton(
      child: const Text(
        "顯示對話盒5",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () async {
        var ans = await _showDialog5(context);
        print(ans);
      },
    );

    final page = Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            child: btn,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(20),
          ),
          Container(
            child: btn2,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(20),
          ),
          Container(
            child: btn3,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(20),
          ),
          Container(
            child: btn4,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(20),
          ),
          Container(
            child: btn5,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(20),
          ),
        ],
      ),
    );

    return page;
  }

  _showDialog(BuildContext context) async {
    var dlg = AlertDialog(
      title: const Text("對話盒標題"),
      content: const Text("對話盒文字"),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    await showDialog(
      context: context,
      builder: (context) => dlg,
    );
  }

  _showDialog2(BuildContext context) async {
    var dlg = AlertDialog(
      content: const Text("程式結束前是否要儲存檔案？"),
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      contentTextStyle: const TextStyle(color: Colors.indigo, fontSize: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      actions: [
        TextButton(
          child: const Text(
            "是",
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context, 1),
        ),
        TextButton(
          child: const Text(
            "否",
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context, 0),
        ),
        TextButton(
          child: const Text(
            "取消",
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context, -1),
        ),
      ],
    );

    var ans = showDialog(
      context: context,
      builder: (context) => dlg,
    );

    return ans;
  }

  _showDialog3(BuildContext context) async {
    final selectLocation = _SelectLocation(GlobalKey<_SelectLocationState>());

    var dlg = AlertDialog(
      content: selectLocation,
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      actions: [
        TextButton(
          child: const Text(
            "取消",
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context, "取消");
          },
        ),
        TextButton(
          child: const Text(
            "確定",
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context, selectLocation.getSelectedLocation());
          },
        ),
      ],
    );

    var ans = await showDialog(
      context: context,
      builder: (context) => dlg,
    );

    return ans;
  }

  _showDialog4(BuildContext context) async {
    var dlg = SimpleDialog(
      title: const Text("程式結束前是否要儲存檔案？"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      children: [
        SimpleDialogOption(
          child: const Text(
            "是",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context, 1),
        ),
        SimpleDialogOption(
          child: const Text(
            "否",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context, 0),
        ),
        SimpleDialogOption(
          child: const Text(
            "取消",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context, -1),
        ),
      ],
    );

    var ans = await showDialog(
      context: context,
      builder: (context) => dlg,
    );

    return ans;
  }

  _showDialog5(BuildContext context) async {
    final selectLocation = _SelectLocation(GlobalKey<_SelectLocationState>());
    final btnCancel = TextButton(
      child: const Text(
        "取消",
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
      onPressed: () {
        Navigator.pop(context, "取消");
      },
    );
    final btnOK = ElevatedButton(
      child: const Text(
        "確定",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: () {
        Navigator.pop(context, selectLocation.getSelectedLocation());
      },
    );

    final btns = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 5, 5),
            child: btnCancel,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 10, 5),
            child: btnOK,
          ),
        ),
      ],
    );

    var dlg = WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            selectLocation,
            btns,
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    var ans = await showDialog(
      context: context,
      builder: (context) => dlg,
    );

    return ans;
  }
}

class _SelectLocation extends StatefulWidget {
  const _SelectLocation(this._key) : super(key: _key);

  final GlobalKey<_SelectLocationState> _key;

  @override
  _SelectLocationState createState() => _SelectLocationState();

  getSelectedLocation() => _key.currentState!.getSelectedLOcation();
}

class _SelectLocationState extends State<_SelectLocation> {
  final _locations = <String>["倫敦", "東京", "夏威夷"];
  var _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    var radioItems = <RadioListTile>[];

    for (var i = 0; i < _locations.length; i++) {
      radioItems.add(
        RadioListTile(
          value: i,
          groupValue: _groupValue,
          title: Text(
            _locations[i],
            style: const TextStyle(fontSize: 20),
          ),
          onChanged: (value) {
            _updateGroupValue(value);
          },
        ),
      );
    }

    final widget = Column(
      mainAxisSize: MainAxisSize.min,
      children: radioItems,
    );

    return widget;
  }

  _updateGroupValue(int groupValue) {
    setState(() {
      _groupValue = groupValue;
    });
  }

  getSelectedLOcation() => _locations[_groupValue];
}
