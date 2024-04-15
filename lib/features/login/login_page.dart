import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_apps/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _isError = false;
  var username = '';
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  String baseUrl = AppConfig.apiUrl;

  Future<String> _getDeviceId() async {
    var prefs = await SharedPreferences.getInstance();
    var deviceId = prefs.getString("deviceId") ?? '';
    var deviceIdUUID = prefs.getString("deviceIdUUID") ?? '';
    return "$deviceId $deviceIdUUID";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        bottomOpacity: 1.2,
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
              FutureBuilder(
                  future: _getDeviceId(),
                  builder: (c, s) {
                    if (s.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    return Text("Device Id : ${s.data}");
                  }),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Email',
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
              ElevatedButton.icon(
                  onPressed: !_isLoading ? () => _login() : null,
                  icon: _isLoading
                      ? Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(2.0),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : const Icon(Icons.login),
                  label: const Text("Login")),
              Visibility(
                child: SizedBox(height: 40),
                visible: username.isNotEmpty,
              ),
              Visibility(
                child: Text(
                  username,
                  style: TextStyle(color: _isError ? Colors.red : Colors.black),
                ),
                visible: username.isNotEmpty,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Methods
  void _login() async {
    setState(() {
      username = '';
      _isError = false;
      _isLoading = true;
    });

    http.Response response = await _loginApi();

    if (response.statusCode == 200) {
      var resData = json.decode(response.body);
      var token = resData['access_token'];

      http.Response userMe = await _userMe(token);
      if (userMe.statusCode == 200) {
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString('token', token);
        });
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString('username', username);
        });

        var resBody = json.decode(userMe.body);

        setState(() {
          username = resBody['name'];
        });
        Future.delayed(Duration(seconds: 2), () {
          context.pushReplacement('/home/$username');
        });
      } else {
        throw Exception("error");
      }
    } else {
      setState(() {
        var resData = json.decode(response.body);
        username = resData['message'] ?? 'Error';
        _isError = true;
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<http.Response> _loginApi() async {
    var prefs = await SharedPreferences.getInstance();
    Uri uri = Uri.https(baseUrl, "/api/v1/auth/signin");
    var body = {
      "email": usernameController.text.trim(),
      "password": passwordController.text.trim(),
      "deviceId": prefs.getString("deviceIdUUID") ?? "",
    };

    var response = await http.post(uri,
        body: json.encode(body), headers: AppConfig.headers);

    return response;
  }

  Future<http.Response> _userMe(String token) async {
    Uri uri = Uri.https(baseUrl, "/api/v1/user/me");

    Map<String, String> headers = Map.from(AppConfig.headers);
    headers['Authorization'] = 'Bearer $token';

    var response = await http.get(uri, headers: headers);
    return response;
  }
}
