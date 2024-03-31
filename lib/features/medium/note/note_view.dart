import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_template/drawer.dart';
import 'package:simple_flutter_template/features/medium/note/add/note_add.dart';
import 'package:simple_flutter_template/models/Note.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteState();
}

List<Color> _generateRandomColors(int count) {
  List<Color> colors = [];
  Random random = Random();
  for (int i = 0; i < count; i++) {
    colors.add(
      Color.fromRGBO(
        150 + random.nextInt(106), // Red
        150 + random.nextInt(106), // Green
        150 + random.nextInt(106), // Blue
        1, // Alpha (opacity)
      ),
    );
  }
  return colors;
}

class _NoteState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    List<Note> notesData = notes;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NoteView',
          textAlign: TextAlign.left,
        ),
      ),
      drawer: drawerList(context, username: "Halo om "),
      backgroundColor: Color(0xff252525),
      body: Container(
        padding: EdgeInsets.all(10),
        child: notesData.isEmpty
            ? Container(
                child: Center(
                  child: Container(
                    child: SvgPicture.asset("assets/icons/tip/logo.svg"),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: notesData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: _generateRandomColors(notesData.length)[index],
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          textAlign: TextAlign.left,
                          notesData[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: GoogleFonts.nunito().fontFamily,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddNote()));
              },
              splashColor: Colors.blue,
              backgroundColor: Color(0xff252525),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1000),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
