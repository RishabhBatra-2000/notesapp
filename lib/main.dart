import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notesapp/pages/login.dart';
import 'package:localstorage/localstorage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final LocalStorage storage = new LocalStorage('app_name');

void storePassword(String password) async {
  await storage.ready;
  await storage.setItem('password', password);
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
        scaffoldBackgroundColor: Color(0xff070706), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
      ),
      home: LoginPage(),
    );
  }
}
