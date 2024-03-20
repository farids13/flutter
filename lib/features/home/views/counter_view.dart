import 'package:flutter/material.dart';
import 'package:simple_flutter_template/features/home/home_view_model.dart';
import 'package:watch_it/watch_it.dart';

class CounterView extends StatelessWidget with WatchItMixin {
  @override
  Widget build(BuildContext context) {
    final counter = watchPropertyValue((HomeViewModel vm) => vm.counter);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Counter',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 16),
          Text(
            counter.toString(),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
