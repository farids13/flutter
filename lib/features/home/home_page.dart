import 'package:flutter/material.dart';
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
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: LogoutButtonView()),
                Expanded(child: TokenView(username: widget.username)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: CounterView()),
                Expanded(child: CounterButtonView()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
