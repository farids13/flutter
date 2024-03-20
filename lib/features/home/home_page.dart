import 'package:flutter/material.dart';
import 'package:simple_flutter_template/features/home/home_view_model.dart';
import 'package:simple_flutter_template/features/home/views/counter_button_view.dart';
import 'package:simple_flutter_template/features/home/views/counter_view.dart';
import 'package:simple_flutter_template/features/home/views/logout_button_view.dart';
import 'package:simple_flutter_template/features/home/views/token_view.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    HomeViewModel.register();

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
                Expanded(child: TokenView(username: username)),
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
