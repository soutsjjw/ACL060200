import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesUtil {
  static const _key_name = "name";

  static final SharePreferencesUtil _spu = SharePreferencesUtil._privConstructor();

  factory SharePreferencesUtil() => _spu;

  SharePreferencesUtil._privConstructor();

  setName(String name) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(_key_name, name);
  }

  Future<String?> getName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(_key_name);
  }
}