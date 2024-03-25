import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_flutter_template/drawer.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
      ),
      drawer: drawerList(context, username: ""),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 1,
            image: AssetImage('assets/design/mobile-design-tip.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: SvgPicture.asset('assets/icons/tip/logo.svg'),
            )
          ],
        ),
      ),
    );
  }
}
