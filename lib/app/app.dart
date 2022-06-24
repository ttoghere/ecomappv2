import 'package:ecomappv2/presentation/management/management_shelf.dart';
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
      debugShowCheckedModeBanner: false,
      title: "Ecom App",
      theme: getApplicationTheme(),
      initialRoute: Routes.loginRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
