import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<void> setUserID(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
  }

  Future<void> setUserEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  Future<void> setUserPassword(String pass) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('pass', pass);
  }

  Future<String?> getUserPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('pass');
  }

  Future<String?> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  Future<String?> getUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  Future<void> removeUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
  }

  Future<void> removeUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
  }

  Future<void> removeUserPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('pass');
  }
}
