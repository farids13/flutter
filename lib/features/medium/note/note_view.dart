import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_apps/Databases/notes_database.dart';
import 'package:note_apps/drawer.dart';
import 'package:note_apps/features/medium/note/pages/note_detail_page.dart';
import 'package:note_apps/features/medium/note/pages/upsert_note.dart';
import 'package:note_apps/features/medium/note/widget/note_card_widget.dart';
import 'package:note_apps/models/NoteModel.dart';

class NoteView extends StatefulWidget {
  final String username;
  const NoteView({super.key, required this.username});

  @override
  State<NoteView> createState() => _NoteState();
}

class _NoteState extends State<NoteView> {
  List<Note> notesData = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fecthNotes();
  }

  Future<void> _fecthNotes() async {
    List<Note> notes = await NotesDatabase.instance.getListNotes();
    setState(() {
      notesData = notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Note View',
          textAlign: TextAlign.left,
        ),
      ),
      drawer: drawerList(context, username: widget.username),
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
              : buildNotes()),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UpsertNote()));
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

  Future refreshNotes() async {
    setState(() => isLoading = true);

    notesData = await NotesDatabase.instance.getListNotes();

    setState(() => isLoading = false);
  }

  Widget buildNotes() => StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: List.generate(notesData.length, (index) {
        final note = notesData[index];
        return StaggeredGridTile.fit(
          crossAxisCellCount: 1,
          child: GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NoteDetailPage(
                        noteId: note.id!,
                      )));

              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),
          ),
        );
      }));
}
