import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal(); // Private named Constructor
  static const MyApp instance = MyApp._internal(); // Singleton
  factory MyApp() => instance; //Factory Constructor

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ecom App",
      theme: ThemeData(),
      home: const Scaffold(),
    );
  }
}
