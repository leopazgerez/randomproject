import 'package:flutter/material.dart';
import 'package:projecttest/src/ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff0b0f14),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
