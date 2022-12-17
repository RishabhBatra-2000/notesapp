import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notesapp/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'notes',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        accentColor: Colors.purple,
        scaffoldBackgroundColor: Color(0xff070706),
      ),
      home: LoginPage(),
    );
  }
}
