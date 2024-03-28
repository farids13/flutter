import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_flutter_template/drawer.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Note',
          textAlign: TextAlign.left,
        ),
      ),
      drawer: drawerList(context, username: "Halo om "),
      backgroundColor: Color(0xff252525),
      body: Container(
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            child: SvgPicture.asset("assets/icons/note/note_hero.svg"),
          ),
        ),
      ),
    );
  }
}
