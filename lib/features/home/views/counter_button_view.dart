import 'package:flutter/material.dart';
import 'package:note_apps/features/home/home_view_model.dart';
import 'package:watch_it/watch_it.dart';

class CounterButtonView extends StatelessWidget with WatchItMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => di<HomeViewModel>().incrementCounter(),
              child: Text('Tambah Om'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => di<HomeViewModel>().decreaseCounter(),
              child: Text('Kurang Om'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
