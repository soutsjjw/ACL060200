import 'package:chapter026_order_food/data.dart';
import 'package:flutter/material.dart';

class SelectMainCourse extends StatelessWidget {
  const SelectMainCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("選擇主餐"),
    );

    final mainCourseRadioGroup =
        _MainCourseRadioGroup(GlobalKey<_MainCourseRadioGroupState>(),
        Data.mainCourseItem ?? 0);

    final btn = ElevatedButton(
      child: const Text("確定"),
      onPressed: () {
        Navigator.pop(context, mainCourseRadioGroup.getSelectedItem());
      },
    );

    final widget = Center(
      child: Column(
        children: [
          Container(
            child: mainCourseRadioGroup,
            width: 200,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            child: btn,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
        ],
      ),
    );

    final page = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return page;
  }
}

class _MainCourseRadioGroup extends StatefulWidget {
  _MainCourseRadioGroup(this._key, this._groupValue) : super(key: _key);

  final GlobalKey<_MainCourseRadioGroupState> _key;
  final _mainCourses = const <String>['牛肉麵', '排骨飯', '魚排飯'];
  late int _groupValue;

  @override
  _MainCourseRadioGroupState createState() => _MainCourseRadioGroupState();

  getSelectedItem() => _key.currentState!.getSelectedItem();
}

class _MainCourseRadioGroupState extends State<_MainCourseRadioGroup> {
  @override
  Widget build(BuildContext context) {
    var radioItems = <RadioListTile>[];

    for (var i = 0; i < widget._mainCourses.length; i++) {
      radioItems.add(RadioListTile(
        value: i,
        groupValue: widget._groupValue,
        title: Text(
          widget._mainCourses[i],
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        onChanged: (value) {
          _updateGroupdValue(value, widget);
        },
      ));
    }

    final w = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: radioItems,
    );

    return w;
  }

  _updateGroupdValue(int groupValue, _MainCourseRadioGroup widget) {
    setState(() {
      widget._groupValue = groupValue;
      Data.mainCourseItem = groupValue;
    });
  }

  getSelectedItem() => widget._mainCourses[widget._groupValue];
}
