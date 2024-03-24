import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_template/drawer.dart';

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Page'),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      drawer: drawerList(context, username: ""),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.8,
            image: AssetImage('assets/design/mobile-design.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(28, 75, 28, 75),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 55,
                    child: Icon(
                      Icons.account_circle,
                    ),
                  ),
                ),
                SizedBox(height: 28),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Jessica Randall",
                        style: GoogleFonts.inter(
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
