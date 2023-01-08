import 'package:flutter/material.dart';
import 'home.dart';
import 'add.dart';


void main() {
  runApp(MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/home': (context) => Home(),
        '/add': (context) => AddEmployeePage(),
      }
  ));
}
