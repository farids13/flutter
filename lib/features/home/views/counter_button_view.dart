import 'package:flutter/material.dart';
import 'package:simple_flutter_template/features/home/home_view_model.dart';
import 'package:watch_it/watch_it.dart';

class CounterButtonView extends StatelessWidget with WatchItMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => di<HomeViewModel>().incrementCounter(),
        child: Text('Increase'),
      ),
    );
  }
}
