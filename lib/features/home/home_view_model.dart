import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_it/watch_it.dart';

class HomeViewModel extends ChangeNotifier {
  var _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    notifyListeners();
  }

  var _counter = 0;
  int get counter => _counter;
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }

  void incrementCounter() {
    counter++;
  }

  void logOut() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('token');
    });
  }

  static void unregister() {
    if (di.isRegistered<HomeViewModel>()) {
      di.unregister<HomeViewModel>();
    }
  }

  static void register() {
    if (!di.isRegistered<HomeViewModel>()) {
      di.registerSingleton<HomeViewModel>(HomeViewModel());
    }

    // update token from shared preference
    SharedPreferences.getInstance().then((prefs) {
      di<HomeViewModel>().token = prefs.getString('token') ?? '';
    });
  }
}
