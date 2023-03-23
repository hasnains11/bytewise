import 'package:bytewise/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black87,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontFamily: 'Varela Round',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 22.0,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
            fontFamily: 'Varela Round',
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}