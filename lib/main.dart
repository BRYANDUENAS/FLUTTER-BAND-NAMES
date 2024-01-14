import 'package:flutter/material.dart';
import 'package:band_names_app/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home',
      routes: {
        'home':(_) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Material App',
    );
  }
}