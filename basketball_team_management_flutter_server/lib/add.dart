import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'employee.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  late String name = "";
  late int age = -1;
  late String occupation = "";
  late int salary = -1;
  late int experience = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add"),
          backgroundColor: CupertinoColors.systemGreen,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(labelText: 'Name',
                        labelStyle: TextStyle(
                            color: Colors.black)),
                    onChanged: (value) => name = value,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(labelText: 'Age',
                        labelStyle: TextStyle(
                            color: Colors.black)),
                    onChanged: (value) => age = int.parse(value),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(labelText: 'Occupation',
                        labelStyle: TextStyle(
                            color: Colors.black)),
                    onChanged: (value) => occupation = value,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(labelText: 'Salary',
                        labelStyle: TextStyle(
                            color: Colors.black)),
                    onChanged: (value) => salary = int.parse(value),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(labelText: 'Experience',
                        labelStyle: TextStyle(
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
                            'Add',
                            style: const TextStyle(color: CupertinoColors.white)
                        ),
                        onPressed: () {
                          if (name.isEmpty || age == -1 || occupation.isEmpty || salary == -1 || experience == -1) {
                            showCupertinoDialog(
                              context: context,
                              builder: (ctx) => CupertinoAlertDialog(
                                title: const Text("Invalid fields"),
                                content: const Text("You must complete all the fields!"),
                                actions: [
                                  CupertinoDialogAction(
                                      child: const Text("Ok"),
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      }
                                  ),
                                ],
                              ),
                            );
                          }
                          else {
                            addEmployee();
                          }
                        },
                        color: CupertinoColors.systemGreen
                    )
                )],
            )));
  }

  void addEmployee() {
    Employee employee = Employee(id: 0, name: name, age: age, occupation: occupation, salary: salary, experience: experience);
    Navigator.pop(context, employee);
  }
}
