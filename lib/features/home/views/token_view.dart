import 'package:flutter/material.dart';
import 'package:note_apps/features/home/home_view_model.dart';
import 'package:watch_it/watch_it.dart';

class TokenView extends StatelessWidget with WatchItMixin {
  final String username;

  TokenView({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final token = watchPropertyValue((HomeViewModel vm) => vm.token);
    // final username = watchPropertyValue((HomeViewModel vm) => vm.username);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Token: $token ",
            style: TextStyle(fontSize: 16),
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
