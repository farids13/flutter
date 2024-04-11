import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_template/drawer.dart';

class TipCalculator extends StatefulWidget {
  final String username;
  const TipCalculator({super.key, required this.username});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  bool isBg = true;

  final TextEditingController billController = TextEditingController();
  final TextEditingController nopController = TextEditingController();

  double billAmount = 0;
  double tipPercentage = 0;
  int numberOfPeople = 1;
  double tipAmount = 0;
  double totalAmount = 0;

  void reset() {
    setState(() {
      billAmount = 0;
      tipPercentage = 0;
      numberOfPeople = 1;
      tipAmount = 0;
      totalAmount = 0;
      billController.clear();
      nopController.clear();
    });
  }

  @override
  void dispose() {
    billController.dispose();
    nopController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      color: Color(0xff5e7a7d),
      fontSize: 25,
      fontFamily: GoogleFonts.spaceMono().fontFamily,
      fontWeight: FontWeight.w700,
    );

    Widget buttonStyle(
      String text,
      Function() func,
      double? width,
    ) {
      return SizedBox(
        width: width ?? 150,
        height: 50,
        child: ElevatedButton(
          onPressed: func,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff5e7a7d),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: GoogleFonts.spaceMono().fontFamily,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
      ),
      drawer: drawerList(context, username: widget.username),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xffc5e4e7),
          image: DecorationImage(
            opacity: 0.0,
            image: AssetImage('assets/design/mobile-design-tip.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: ListView(
          children: [
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(30),
                alignment: Alignment.topCenter,
                child: SvgPicture.asset('assets/icons/tip/logo.svg'),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height * 0.15,
              child: Container(
                height: MediaQuery.of(context).size.height * 1.00,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: TextField(
                          controller: billController,
                          onChanged: (value) {
                            setState(() {
                              billAmount = double.parse(value);
                            });
                          },
                          style: style,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.attach_money),
                            label: Text(
                              "Bill",
                              style: style,
                            ),
                            border: OutlineInputBorder(),
                            hintTextDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buttonStyle(
                                  "5%",
                                  () => {setState(() => tipPercentage = 0.05)},
                                  null),
                              buttonStyle(
                                  "10%",
                                  () => {setState(() => tipPercentage = 0.1)},
                                  null),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buttonStyle(
                                  "15%",
                                  () => {setState(() => tipPercentage = 0.15)},
                                  null),
                              buttonStyle(
                                  "20%",
                                  () => {setState(() => tipPercentage = 0.2)},
                                  null),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buttonStyle(
                                "50%",
                                () => {setState(() => tipPercentage = 0.5)},
                                null,
                              ),
                              Container(
                                width: 150,
                                height: 50,
                                child: TextField(
                                  onChanged: (value) => {
                                    setState(() {
                                      tipPercentage = double.parse(value) / 100;
                                    })
                                  },
                                  textAlign: TextAlign.right,
                                  style: style,
                                  decoration: InputDecoration(
                                    label: Text(
                                      "Custom",
                                    ),
                                    labelStyle: style,
                                    contentPadding: EdgeInsets.only(left: 25),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintTextDirection: TextDirection.rtl,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: TextField(
                        controller: nopController,
                        onChanged: (value) => {
                          setState(() {
                            numberOfPeople = int.parse(value);
                          })
                        },
                        style: style,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          label: Text(
                            "Number Of People",
                            style: style,
                          ),
                          border: OutlineInputBorder(),
                          hintTextDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            double availableWidth = constraints.maxWidth;
                            return Container(
                              width: availableWidth,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              text: "Tip Amount",
                                              style: style,
                                              children: [
                                                TextSpan(
                                                  text: "\n/ person",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            '\$${double.parse((billAmount * tipPercentage / numberOfPeople).toString()).toStringAsFixed(2)}',
                                            style: style,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              text: "Total",
                                              style: style,
                                              children: [
                                                TextSpan(
                                                  text: "\n/ person",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            '\$${double.parse(((billAmount + (billAmount * tipPercentage)) / numberOfPeople).toString()).toStringAsFixed(2)}',
                                            style: style,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      buttonStyle("Reset", () => {reset()},
                                          double.infinity),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
