import 'package:flutter/material.dart';
import 'package:simple_flutter_template/features/home/home_view_model.dart';
import 'package:watch_it/watch_it.dart';

class TokenView extends StatelessWidget with WatchItMixin {
  final String username;

  TokenView({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final token = watchPropertyValue((HomeViewModel vm) => vm.token);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Token: $token",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          Text(
            "Username: $username",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
