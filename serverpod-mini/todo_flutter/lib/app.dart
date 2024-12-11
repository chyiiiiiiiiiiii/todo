import 'package:flutter/material.dart';
import 'package:todo_flutter/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Todo Example'),
      debugShowCheckedModeBanner: false,
    );
  }
}
