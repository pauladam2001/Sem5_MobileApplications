import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:basketball_team_management_flutter/add.dart';
import 'package:basketball_team_management_flutter/update.dart';
import 'package:basketball_team_management_flutter/databaseHelper.dart';
import 'package:basketball_team_management_flutter/employee.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Employees"),
          backgroundColor: CupertinoColors.systemGreen,
        ),
        body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<List<Employee>?> (
            future: DatabaseHelper.getEmployees(),
            builder: (context, AsyncSnapshot<List<Employee>?> snapshot) {   // AsyncSnapshot - immutable representation of the most recent interaction with an asynchronous computation
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              else if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return  ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                                children: [
                                  Text(
                                      snapshot.data![index].name,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      )
                                  )
                                ]
                            ),
                            const Spacer(),
                            Column(
                                children: [
                                  Text(
                                      "${snapshot.data![index].age} years old",
                                      style: const TextStyle(
                                          fontSize: 20
                                      )
                                  )
                                ]
                            ),
                            const Spacer(),
                            Column(
                                children: [
                                  Text(
                                      snapshot.data![index].occupation,
                                      style: const TextStyle(
                                          fontSize: 20
                                      )
                                  )
                                ]
                            ),
                            const Spacer(),
                            Column(
                                children: [
                                  Text(
                                      "${snapshot.data![index].salary}\$",
                                      style: const TextStyle(
                                          fontSize: 20
                                      )
                                  )
                                ]
                            ),
                            const Spacer(),
                            GestureDetector(
                                child: const Icon(
                                    CupertinoIcons.paintbrush,
                                    size: 25
                                ),
                                onTap: () async {
                                  Employee employee = await Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateEmployeePage(employee: snapshot.data![index])));
                                  await DatabaseHelper.updateEmployee(employee.id, employee.name, employee.age, employee.occupation, employee.salary, employee.experience);
                                  setState(() {});
                                }
                            ),
                            GestureDetector(
                                child: const Icon(
                                    CupertinoIcons.trash_circle,
                                    size: 25
                                ),
                                onTap: () async {
                                  deleteEmployee(snapshot.data![index].id);
                                }
                            )
                          ],
                        );
                      });
                }
                return const Center(
                  child: Text('No employees yet'),
                );
              }
              return const SizedBox.shrink();
            }
        )),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Employee employee = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddEmployeePage()));

              await DatabaseHelper.addEmployee(employee.name, employee.age, employee.occupation, employee.salary, employee.experience);

              setState(() {});
            },
            backgroundColor: CupertinoColors.systemGreen,
            child: const Icon(Icons.add_reaction)
        ));
  }

  void deleteEmployee(int index) {
    showCupertinoDialog(
        context: context,
        builder: (ctx) =>
            CupertinoAlertDialog(
              title: const Text("Delete"),
              content: const Text("Are you sure you want to delete this employee?"),
              actions: [
                CupertinoDialogAction(
                  child: const Text("Yes"),
                  onPressed:  () async {
                    await DatabaseHelper.deleteEmployee(index);
                    Navigator.pop(ctx);
                    setState(() {});
                  },
                ),
                CupertinoDialogAction(
                  child: const Text("No"),
                  onPressed: () {
                    Navigator.pop(ctx);
                    // setState(() {});
                  },
                ),
              ],
            ));
  }
}
