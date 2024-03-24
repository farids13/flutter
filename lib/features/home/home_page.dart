import 'package:flutter/material.dart';
import 'package:simple_flutter_template/drawer.dart';
import 'package:simple_flutter_template/features/home/home_view_model.dart';
import 'package:simple_flutter_template/features/home/views/counter_button_view.dart';
import 'package:simple_flutter_template/features/home/views/counter_view.dart';
import 'package:simple_flutter_template/features/home/views/logout_button_view.dart';
import 'package:simple_flutter_template/features/home/views/token_view.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    HomeViewModel.register();
  }

  @override
  void dispose() {
    super.dispose();
    HomeViewModel.unregister();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page : ${widget.username}'),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      drawer: drawerList(context, username: widget.username),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(child: TokenView(username: widget.username)),
                Expanded(child: LogoutButtonView()),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: Column(
                children: [
                  Expanded(child: CounterView()),
                  Expanded(child: CounterButtonView()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
