import 'package:shared_preferences/shared_preferences.dart';

Future setToLocalStorage({String? name, dynamic data}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(name!, data);
}

// getFromLocalStorage() method will get data from the local storage
Future getFromLocalStorage({String? name}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data = prefs.getString(name!);
  return data;
}

removeFromLocalStorage({String? name}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(name!);
}