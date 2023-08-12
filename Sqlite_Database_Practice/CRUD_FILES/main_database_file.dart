import 'package:flutter/material.dart';

import 'insert_product.dart';

Future main(List<String> args) async {
  runApp(const DataBaseApp());
}


class DataBaseApp extends StatefulWidget {
  const DataBaseApp({super.key});

  @override
  State<DataBaseApp> createState() => _DataBaseAppState();
}

class _DataBaseAppState extends State<DataBaseApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lime),
      home: const DataBasePages(),
    );
  }
}


class DataBasePages extends StatefulWidget {
  const DataBasePages({super.key});

  @override
  State<DataBasePages> createState() => _DataBasePagesState();
}

class _DataBasePagesState extends State<DataBasePages> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InsertDataBase(),
    );
  }
} 