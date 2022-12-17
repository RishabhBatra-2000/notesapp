import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/pages/addnote.dart';
import 'package:notesapp/pages/viewnote.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes');

  List<Color> myColors = [
    Color.fromRGBO(71, 229, 188, 10),
    Color.fromRGBO(246, 189, 96, 10),
    Color.fromRGBO(255, 153, 200, 10),
    Color.fromRGBO(18, 130, 162, 10),
    Color.fromRGBO(249, 111, 93, 10),
    Color.fromRGBO(251, 242, 192, 10),
    Color.fromRGBO(156, 222, 159, 10),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //onPressed function
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => AddNote())))
                .then((value) {
              print("Calling set state !");
              setState(() {});
            });
          },
          backgroundColor: Color.fromARGB(255, 97, 97, 97),
          child: Icon(
            Icons.add,
            color: Colors.white70,
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Notes",
            style: TextStyle(
              fontFamily: "lato",
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 193, 193, 193),
            ),
          ),
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    Random random = new Random();
                    Color bg = myColors[random.nextInt(7)];
                    Map? data = snapshot.data?.docs[index].data() as Map?;
                    DateTime myDateTime = data!['created'].toDate();
                    String formattedTime =
                        DateFormat.yMMMMd().add_jm().format(myDateTime);
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                          builder: (context) => ViewNote(data, formattedTime,
                              snapshot.data!.docs[index].reference),
                        ))
                            .then(
                          (value) {
                            setState(() {});
                          },
                        );
                      },
                      child: Card(
                        color: bg,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data['title']}",
                                style: TextStyle(
                                  fontFamily: "lato",
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  formattedTime,
                                  style: TextStyle(
                                    fontFamily: "lato",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text("Loading..."),
              );
            }
          },
        ));
  }
}
