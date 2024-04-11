import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      await _checkLoginStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Icon(
          Icons.ac_unit,
          size: 100,
          color: Colors.blue,
        ),
      ),
    );
  }

  /// Methods
  Future<void> _checkLoginStatus() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    if (token != null && token.isNotEmpty) {
      context.pushReplacement('/home/${prefs.getString('username')}');
    } else {
      context.go('/login');
    }
  }
}
