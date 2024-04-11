import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_flutter_template/Databases/notes_database.dart';
import 'package:simple_flutter_template/models/NoteModel.dart';

class UpsertNote extends StatefulWidget {
  final Note? note;
  const UpsertNote({Key? key, this.note}) : super(key: key);

  @override
  State<UpsertNote> createState() => UpsertNoteState();
}

class UpsertNoteState extends State<UpsertNote> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _contentController;

  Color colorStatus = Colors.red;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.note;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.note == null ? Text("New Note") : Text("Update Note"),
        automaticallyImplyLeading: true,
        actions: [
          SizedBox(
            width: 20,
            height: 20,
            child: Container(
              decoration: BoxDecoration(
                  color: colorStatus, borderRadius: BorderRadius.circular(20)),
            ),
          ),
          buildButton()
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _titleController,
                validator: (value) => (value ?? '').isEmpty ? 'Required' : null,
                onChanged: (value) {
                  autoSave(
                    Duration(seconds: 2),
                  );
                },
                maxLines: null,
                style: TextStyle(
                  fontFamily: GoogleFonts.nunito().fontFamily,
                  fontSize: 48,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    fontFamily: GoogleFonts.nunito().fontFamily,
                    fontSize: 48,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _contentController,
                onChanged: (value) {
                  autoSave(
                    Duration(seconds: 2),
                  );
                },
                validator: (value) => (value ?? '').isEmpty ? 'Required' : null,
                maxLines: null,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: InputBorder.none,
                    labelText: 'Content',
                    labelStyle: TextStyle(
                      fontFamily: GoogleFonts.nunito().fontFamily,
                      fontSize: 24,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton() {
    return Row(children: [
      IconButton(
        onPressed: () => {},
        icon: Icon(Icons.visibility),
      ),
      IconButton(
        onPressed: () => {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.info,
                  size: 34,
                ),
              ),
              content: SizedBox(
                width: 330,
                child: Text(
                  "Save Changes ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: GoogleFonts.nunito().fontFamily,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              Size(112, 39),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 18, 185, 82),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          onPressed: addOrUpdateNote,
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              Size(112, 39),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        },
        icon: Icon(Icons.save),
      ),
    ]);
  }

  void autoSave(Duration duration) {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(duration, () {
      setState(() {
        colorStatus = Colors.green;
      });
      updateNote();
    });
    setState(() {
      colorStatus = Colors.red;
    });
  }

  void addOrUpdateNote() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final isUpdating = widget.note != null;

      print(isUpdating);

      if (isUpdating) {
        updateNote();
      } else {
        addNote();
      }
      context.pushReplacement("/note");
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      title: _titleController.text,
      note: _contentController.text,
    );
    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      title: _titleController.text,
      note: _contentController.text,
      createdAt: DateTime.now(),
    );
    print(note.title);
    await NotesDatabase.instance.create(note);
  }
}
