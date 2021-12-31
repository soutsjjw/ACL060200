import 'package:chapter026_order_food/data.dart';
import 'package:flutter/material.dart';

class SelectDrink extends StatelessWidget {
  const SelectDrink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("選擇飲料"),
    );

    final drinkRadioGroup =
    _DrinkRadioGroup(GlobalKey<_DrinkRadioGroupState>(),
        Data.drinkItem ?? 0);

    final btn = ElevatedButton(
      child: const Text("確定"),
      onPressed: () {
        Navigator.pop(context, drinkRadioGroup.getSelectedItem());
      },
    );

    final widget = Center(
      child: Column(
        children: [
          Container(
            child: drinkRadioGroup,
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

class _DrinkRadioGroup extends StatefulWidget {
  _DrinkRadioGroup(this._key, this._groupValue) : super(key: _key);

  final GlobalKey<_DrinkRadioGroupState> _key;
  final _drinks = const <String>['紅茶', '綠茶'];
  late int _groupValue;

  @override
  _DrinkRadioGroupState createState() => _DrinkRadioGroupState();

  getSelectedItem() => _key.currentState!.getSelectedItem();
}

class _DrinkRadioGroupState extends State<_DrinkRadioGroup> {
  @override
  Widget build(BuildContext context) {
    var radioItems = <RadioListTile>[];

    for (var i = 0; i < widget._drinks.length; i++) {
      radioItems.add(RadioListTile(
        value: i,
        groupValue: widget._groupValue,
        title: Text(
          widget._drinks[i],
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

  _updateGroupdValue(int groupValue, _DrinkRadioGroup widget) {
    setState(() {
      widget._groupValue = groupValue;
      Data.drinkItem = groupValue;
    });
  }

  getSelectedItem() => widget._drinks[widget._groupValue];
}
