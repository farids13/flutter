import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_template/drawer.dart';

class SocialPage extends StatelessWidget {
  final String username;
  const SocialPage({super.key, required this.username});

  Widget buttonRondedStyle(String buttonText) {
    return Container(
      margin: EdgeInsets.all(9),
      child: ElevatedButton(
        onPressed: () {},
        child: SizedBox(
          width: 270,
          height: 51,
          child: Center(
            child: Text(
              buttonText,
              style: GoogleFonts.inter(
                color: Colors.white,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Adjust the value as needed
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Color(0xff333333),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141414),
      appBar: AppBar(
        title: Text('Social Page'),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      drawer: drawerList(context, username: username),
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
            color: Color(0xff1f1f1f),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage:
                        AssetImage('assets/images/avatar-jessica.jpeg'),
                    child: false == true
                        ? Icon(
                            Icons.person,
                            size: 100,
                          )
                        : null,
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
                            textStyle: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "London, United Kingdom",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textStyle: TextStyle(
                            color: Colors.lightGreenAccent,
                            letterSpacing: 0.01,
                          ),
                        ),
                      ),
                      SizedBox(height: 27),
                      Text(
                        '"Front-end developer and avid reader."',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          textStyle: TextStyle(
                              color: Colors.white70, letterSpacing: 0.2),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 22),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttonRondedStyle("GitHub"),
                      buttonRondedStyle("Frontend Mentor"),
                      buttonRondedStyle("Linked In"),
                      buttonRondedStyle("Twitter"),
                      buttonRondedStyle("Instagram"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
