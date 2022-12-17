import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String title = '';
  String des = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey[700])),
                  ), //
                  ElevatedButton(
                    onPressed: add,
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontFamily: "lato",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.grey[700],
                        ),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 8,
                        ))),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration.collapsed(
                      hintText: "Tittle",
                    ),
                    style: TextStyle(
                      fontFamily: "lato",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    onChanged: (_val) {
                      title = _val;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(
                        hintText: "Description",
                      ),
                      style: TextStyle(
                        fontFamily: "lato",
                        fontSize: 18,
                        color: Color.fromRGBO(235, 235, 235, 1),
                      ),
                      onChanged: (_val) {
                        des = _val;
                      },
                      maxLines: 20,
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    ));
  }

  void add() async {
    // save to database
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes');

    var data = {
      'title': title,
      'description': des,
      'created': DateTime.now(),
    };

    ref.add(data);
    //
    Navigator.pop(context);
  }
}
