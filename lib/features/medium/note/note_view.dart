import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_flutter_template/drawer.dart';
import 'package:simple_flutter_template/features/medium/note/add/note_add.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteState();
}

class _NoteState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NoteView',
          textAlign: TextAlign.left,
        ),
      ),
      drawer: drawerList(context, username: "Halo om "),
      // backgroundColor: Color(0xff252525),
      body: Container(
        child: Center(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: SvgPicture.asset("assets/icons/tip/logo.svg"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNote()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
