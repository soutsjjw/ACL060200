import 'package:flutter/material.dart';

abstract class Language {

  // 這個方法會根據手機的語言設定，傳回App中對應的語言類別
  static Language? of(BuildContext context) {
    return Localizations.of<Language>(context, Language);
  }

  // 以下是App用到的多國語言字串
  String get appTitle;
  String get item1;
  String get item2;
  String get item3;
  String get select;
  String get itemDescription;
}