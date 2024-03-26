import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_template/drawer.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  bool isBg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
      ),
      drawer: drawerList(context, username: "John Doe"),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.6,
            image: AssetImage('assets/design/mobile-design-tip.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(30),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  color: isBg ? Color(0xffc5e4e7) : Colors.transparent,
                ),
                child: SvgPicture.asset('assets/icons/tip/logo.svg'),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height * 0.15,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                  color: isBg ? Colors.white : null,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        style: TextStyle(
                          color: Color(0xff5e7a7d),
                          fontSize: 25,
                          fontFamily: GoogleFonts.spaceMono().fontFamily,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money),
                          border: OutlineInputBorder(),
                          hintTextDirection: TextDirection.rtl,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
