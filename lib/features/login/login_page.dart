import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter_template/features/home/home_view_model.dart';
import 'package:uuid/uuid.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = '';
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    HomeViewModel.unregister();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 100,
              ),
              SizedBox(height: 20),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(),
                child: Text('Login'),
              ),
              Visibility(
                child: SizedBox(height: 40),
                visible: username.isNotEmpty,
              ),
              Visibility(
                child: Text("Hello $username"),
                visible: username.isNotEmpty,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Methods
  void _login() {
    setState(() {
      username = usernameController.text.trim();
    });
    if (usernameController.text.trim().isNotEmpty) {
      Future.delayed(Duration(seconds: 2), () {
        context.pushReplacement('/home/$username');
      });
      var token = Uuid().v4();
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('token', token);
      });
    }
  }
}
