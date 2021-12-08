import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class AppBody extends StatelessWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genderRadioGroup = _GenderRadioGroup(GlobalKey<_GenderRadioGroupState>());
    final text = _TextWidget(GlobalKey<_TextWidgetState>());
    final agePicker = _AgePicker(GlobalKey<_AgePickerState>(), minValue: 0, maxValue: 150, currentValue: 18,);

    final btn = ElevatedButton(
      child: const Text("確定"),
      onPressed: () {
        text.setText(marrySuggestion(genderRadioGroup.getSelectedItem(), agePicker.getCurrentValue()));
      },
    );

    final widget = Center(
      child: Column(
        children: [
          Container(
            child: const Text("性別：", style: TextStyle(fontSize: 20)),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: genderRadioGroup,
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            child: const Text("年齡：", style: TextStyle(fontSize: 20)),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
            alignment: Alignment.centerLeft,
          ),
          Container(
            child: agePicker,
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

  marrySuggestion(String gender, int age) {
    if (gender == _GenderRadioGroup.male) {
      if (age <= 27) return "不急";
      else if (age > 27 && age <= 32) return "開始找對象";
      else return "趕快結婚";
    } else {
      if (age <= 25) return "不急";
      else if (age > 25 && age <= 30) return "開始找對象";
      else return "趕快結婚";
    }
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

//region Gender widget

class _GenderRadioGroup extends StatefulWidget {
  final GlobalKey<_GenderRadioGroupState> _key;
  static const male = "男生", female = "女生";

  const _GenderRadioGroup(this._key) : super(key: _key);

  @override
  _GenderRadioGroupState createState() => _GenderRadioGroupState();

  getSelectedItem() => _key.currentState!.getSelectedItem();
}

class _GenderRadioGroupState extends State<_GenderRadioGroup> {
  final _genders = const <String>[
    _GenderRadioGroup.male,
    _GenderRadioGroup.female,
  ];
  var _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    var radioItems = <RadioListTile>[];

    for (var i = 0; i < _genders.length; i++) {
      radioItems.add(RadioListTile(
        value: i,
        groupValue: _groupValue,
        title: Text(_genders[i], style: const TextStyle(fontSize: 20),),
        onChanged: (value) {
          _updateGroupValue(value);
        },
      ));
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

  getSelectedItem() => _genders[_groupValue];
}

//endregion

//region Age widget

class _AgePicker extends StatefulWidget {
  final GlobalKey<_AgePickerState> _key;

  var _minValue = 0;
  var _maxValue = 100;
  var _currentValue = 0;

  _AgePicker(this._key,
      {required int minValue, required int maxValue, required int currentValue})
      : _minValue = minValue,
        _maxValue = maxValue,
        _currentValue = currentValue,
        super(key: _key);

  @override
  _AgePickerState createState() => _AgePickerState();

  getCurrentValue() => _currentValue;
}

class _AgePickerState extends State<_AgePicker> {
  @override
  Widget build(BuildContext context) {
    final w = NumberPicker(
        minValue: widget._minValue,
        maxValue: widget._maxValue,
        value: widget._currentValue,
        onChanged: (newValue) => setState(() {
              widget._currentValue = newValue;
            }));

    return w;
  }
}

//endregion

//region Text widget

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

//endregion
