import 'package:api/page.dart';
import 'package:api/testapi.dart';
import 'package:flutter/material.dart';

import 'Nationapi.dart';
import 'api1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: welcome(), debugShowCheckedModeBanner: false);
  }
}
