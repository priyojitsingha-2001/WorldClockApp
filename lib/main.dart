import 'package:flutter/material.dart';
import 'package:world_app/pages/homepage.dart';
import 'package:world_app/pages/chooselocation.dart';
import 'package:world_app/pages/loadingscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const loadingscreen(),
        '/home': (context) => const HomePage(),
        '/location': (context) => const chooselocation(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
