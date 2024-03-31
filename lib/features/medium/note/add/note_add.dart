import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => AddNoteState();
}

class AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Note"),
        automaticallyImplyLeading: true,
        actions: [
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
                              onPressed: () => {},
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
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
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
    );
  }
}
