import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_template/drawer.dart';

class QrPage extends StatelessWidget {
  final String username;
  const QrPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Page Test'),
      ),
      drawer: drawerList(context, username: username),
      backgroundColor: Color(0xffd6e0ee),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffffffff),
              boxShadow: List.generate(2, (index) => BoxShadow()),
              borderRadius: BorderRadius.circular(20)),
          height: 497,
          width: 320,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/qr.png'),
              ),
              SizedBox(height: 24),
              Text(
                'Improve your front-end skills by building projects',
                style: GoogleFonts.outfit(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Scan the QR code to visit Frontend Mentor and take your coding skills to the next level',
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  textStyle: TextStyle(color: Color(0xFF7b879d)),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
