import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btn = _DropdownWidget();

    final widget = Center(
      child: btn,
      heightFactor: 2,
    );

    return widget;
  }
}

class _DropdownWidget extends StatefulWidget {
  _DropdownWidget({Key? key}) : super(key: key);

  int? selectedValue;

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<_DropdownWidget> {
  String? selectedValueX;

  @override
  Widget build(BuildContext context) {
    final btn = DropdownButton<int>(
      items: const [
        DropdownMenuItem(
          child: Text(
            "請選擇",
            style: TextStyle(fontSize: 20),
          ),
          value: null,
        ),
        DropdownMenuItem(
          child: Text(
            "第一項",
            style: TextStyle(fontSize: 20),
          ),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text(
            "第二項",
            style: TextStyle(fontSize: 20),
          ),
          value: 2,
        ),
        DropdownMenuItem(
          child: Text(
            "第三項",
            style: TextStyle(fontSize: 20),
          ),
          value: 3,
        ),
      ],
      onChanged: (value) {
        setState(() {
          widget.selectedValue = value;
        });
      },
      hint: const Text(
        "請選擇",
        style: TextStyle(fontSize: 20),
      ),
      value: widget.selectedValue,
    );

    return btn;
  }
}
