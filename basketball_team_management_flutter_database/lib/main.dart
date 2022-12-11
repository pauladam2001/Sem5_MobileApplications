import 'package:flutter/material.dart';
import 'package:basketball_team_management_flutter/home.dart';
import 'package:basketball_team_management_flutter/add.dart';


void main() {
  runApp(MaterialApp(
      routes: {
        '/': (context) => const Home(),
        '/home': (context) => const Home(),
        '/add': (context) => const AddEmployeePage(),
      }
  ));
}
