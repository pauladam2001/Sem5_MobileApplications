import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:basketball_team_management_flutter/employee.dart';

class UpdateEmployeePage extends StatefulWidget {
  Employee employee;

  UpdateEmployeePage({super.key, required this.employee});

  @override
  State<UpdateEmployeePage> createState() => _UpdateEmployeePageState(employee);
}

class _UpdateEmployeePageState extends State<UpdateEmployeePage> {

  late Employee employee;   // late modifier can be used while declaring a non-nullable variable that's initialized after its declaration

  _UpdateEmployeePageState(this.employee);

  @override
  Widget build(BuildContext context) {

    int id = employee.id;
    String name = employee.name;
    int age = employee.age;
    String occupation = employee.occupation;
    int salary = employee.salary;
    int experience = employee.experience;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit"),
          backgroundColor: CupertinoColors.systemGreen,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                decoration:  InputDecoration(hintText: name,  labelText: 'Name',
                    labelStyle: const TextStyle(
                        color: Colors.black)),
                onChanged: (value) => name = value,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                decoration:  InputDecoration(hintText: age.toString(), labelText: 'Age',
                    labelStyle: const TextStyle(
                        color: Colors.black)),
                onChanged: (value) => age = int.parse(value),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(hintText: occupation, labelText: 'Occupation',
                    labelStyle: const TextStyle(
                        color: Colors.black)),
                onChanged: (value) => occupation = value,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(hintText: salary.toString(), labelText: 'Salary',
                    labelStyle: const TextStyle(
                        color: Colors.black)),
                onChanged: (value) => salary = int.parse(value),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(hintText: experience.toString(), labelText: 'Experiences',
                    labelStyle: const TextStyle(
                        color: Colors.black)),
                onChanged: (value) => experience = int.parse(value),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 50),
              height:100,
              width:300,
              child: CupertinoButton(
                child: Text(
                    'Edit',
                    style: const TextStyle(color: CupertinoColors.white)
                  ),
                  onPressed: () {
                    updateEmployee(id, name, age, occupation, salary, experience);
                  },
                  color: CupertinoColors.systemGreen
            )
            )],
        ));
  }

  void updateEmployee(int id, String name, int age, String occupation, int salary, int experience) {
    Employee employee = Employee(id: id, name: name, age: age, occupation: occupation, salary: salary, experience: experience);
    Navigator.pop(context, employee);
  }
}
