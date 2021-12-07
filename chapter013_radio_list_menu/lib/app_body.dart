import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationRadioGroup =
        _LocationRadioGroup(GlobalKey<_LocationRadioGroupState>());

    final text = _TextWidget(GlobalKey<_TextWidgetState>());

    final btn = ElevatedButton(
      child: const Text("確定"),
      onPressed: () {
        text.setText(locationRadioGroup.getSelectedItem());
      },
    );

    final widget = Center(
      child: Column(
        children: [
          Container(
            child: locationRadioGroup,
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 10),
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
    );

    return widget;
  }
}

class _LocationRadioGroup extends StatefulWidget {
  final GlobalKey<_LocationRadioGroupState> _key;

  const _LocationRadioGroup(this._key) : super(key: _key);

  @override
  State<StatefulWidget> createState() => _LocationRadioGroupState();

  getSelectedItem() => _key.currentState!.getSelectedItem();
}

class _LocationRadioGroupState extends State<_LocationRadioGroup> {
  final _locations = const <String>['倫敦', '東京', '夏威夷'];
  var _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    var radioItems = <RadioListTile>[];

    // 把選項加入radioItems
    for (var i = 0; i < _locations.length; i++) {
      radioItems.add(RadioListTile(
          value: i,
          groupValue: _groupValue,
          title: Text(
            _locations[i],
            style: const TextStyle(fontSize: 20),
          ),
          onChanged: (value) {
            _updateGroupValue(value);
          }));
    }

    final widget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: radioItems,
    );

    return widget;
  }

  _updateGroupValue(int groupValue) {
    setState(() {
      _groupValue = groupValue;
    });
  }

  getSelectedItem() => _locations[_groupValue];
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
