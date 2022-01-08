import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: const Text('Tab標籤頁範例'),
      bottom: const TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.directions_bike),
            text: 'Bike',
          ),
          Tab(
            icon: Icon(Icons.directions_car),
            text: 'Car',
          ),
        ],
      ),
    );

    final tabBarView = TabBarView(
      children: [
        Container(
          child: const Text(
            'Bike page',
            style: TextStyle(fontSize: 20),
          ),
          alignment: Alignment.center,
          color: Colors.black12,
        ),
        Container(
          child: const Text(
            'Car page',
            style: TextStyle(fontSize: 20),
          ),
          alignment: Alignment.center,
        ),
      ],
    );

    final bottomNaviBar = _BottomNaviBar();

    // 結合AppBar和App操作畫面
    final page = DefaultTabController(
      length: tabBarView.children.length,
      child: Scaffold(
        appBar: appBar,
        body: tabBarView,
        bottomNavigationBar: bottomNaviBar,
      ),
    );

    return page;
  }
}

class _LocationRadioGroup extends StatefulWidget {
  final GlobalKey<_LocationRadioGroupState> _key;
  var locations = const <String>['倫敦', '東京', '夏威夷'];
  var groupValue = 0;

  _LocationRadioGroup(this._key) : super(key: _key);

  @override
  State<StatefulWidget> createState() => _LocationRadioGroupState();

  getSelectedItem() => _key.currentState!.getSelectedItem();
}

class _LocationRadioGroupState extends State<_LocationRadioGroup> {
  @override
  Widget build(BuildContext context) {
    var radioItems = <RadioListTile>[];

    // 把選項加入radioItems
    for (var i = 0; i < widget.locations.length; i++) {
      radioItems.add(RadioListTile(
          value: i,
          groupValue: widget.groupValue,
          title: Text(
            widget.locations[i],
            style: const TextStyle(fontSize: 20),
          ),
          onChanged: (value) {
            _updateGroupValue(value);
          }));
    }

    final w = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: radioItems,
    );

    return w;
  }

  _updateGroupValue(int groupValue) {
    setState(() {
      widget.groupValue = groupValue;
    });
  }

  getSelectedItem() => widget.locations[widget.groupValue];
}

class _BottomNaviBar extends StatefulWidget {
  var naviItemIcon = [
    const Icon(Icons.phone),
    const Icon(Icons.email),
    const Icon(Icons.message),
  ];

  var naviItemText = ['Phone', 'Email', 'Line'];

  int selectedIndex = 0;

  @override
  State<StatefulWidget> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<_BottomNaviBar> {
  @override
  Widget build(BuildContext context) {
    final bottomNaviBarItems = <BottomNavigationBarItem>[];

    for (var i = 0; i < widget.naviItemIcon.length; i++) {
      bottomNaviBarItems.add(BottomNavigationBarItem(
        icon: widget.naviItemIcon[i],
        label: widget.naviItemText[i],
      ));
    }

    final w = BottomNavigationBar(
      items: bottomNaviBarItems,
      currentIndex: widget.selectedIndex,
      onTap: (index) {
        setState(() {
          widget.selectedIndex = index;
        });
        Fluttertoast.showToast(
            msg: '選擇${widget.naviItemText[index]}',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            textColor: Colors.white);
      },
    );

    return w;
  }
}
