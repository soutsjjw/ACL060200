import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'locale/app_localizations_delegate.dart';
import 'locale/language.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'),
      ],
      onGenerateTitle: (context) => Language.of(context)!.appTitle,
      // title: 'Flutter Demo',
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
    // 建立AppBar
    final appBar = AppBar(
      title: Text(Language.of(context)!.appTitle),
    );

    // 建立App的操作畫面
    final textWrapper = _TextWrapper(GlobalKey<_TextWrapperState>());

    final items = <String>[
      Language.of(context)!.item1,
      Language.of(context)!.item2,
      Language.of(context)!.item3,
    ];
    const icons = <String>['assets/1.png', 'assets/2.png', 'assets/3.png'];

    var listView = ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) =>
          ListTile(title: Text(items[index], style: const TextStyle(fontSize: 20),),
          onTap: () => textWrapper.setText(Language.of(context)!.select + items[index]),
          leading: Container(
            child: CircleAvatar(backgroundImage: AssetImage(icons[index],),),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),),
          subtitle: Text(Language.of(context)!.itemDescription, style: const TextStyle(fontSize: 16),),),
      separatorBuilder: (context, index) => const Divider(),
    );

    final widget = Container(
      child: Column(
        children: <Widget>[
          textWrapper,
          Expanded(child: listView,),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 10,),
    );

    // 結合AppBar和App操作畫面
    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _TextWrapper extends StatefulWidget {
  final GlobalKey<_TextWrapperState> _key;

  const _TextWrapper(this._key): super (key: _key);

  @override
  State<StatefulWidget> createState() => _TextWrapperState();

  setText(String string) {
    _key.currentState!.setText(string);
  }
}

class _TextWrapperState extends State<_TextWrapper> {
  String _str = '';

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
