import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewNote extends StatefulWidget {
  final Map data;
  final String time;
  final DocumentReference ref;

  ViewNote(this.data, this.time, this.ref);

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
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
                      size: 24.0,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey[700])),
                  ), //
                  ElevatedButton(
                    onPressed: delete,
                    child: Icon(
                      Icons.delete_forever,
                      size: 24.0,
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.red[300],
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.data['title']}",
                    style: TextStyle(
                      fontFamily: "lato",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                    child: Text(
                      widget.time,
                      style: TextStyle(
                        fontFamily: "lato",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Text(
                      "${widget.data['description']}",
                      style: TextStyle(
                        fontFamily: "lato",
                        fontSize: 18,
                        color: Color.fromARGB(255, 208, 207, 207),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  void delete() async {
    //deleting the data to the database
    await widget.ref.delete();
    Navigator.pop(context);
  }
}
