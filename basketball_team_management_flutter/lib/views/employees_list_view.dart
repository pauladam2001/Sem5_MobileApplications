import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:basketball_team_management_flutter/viewmodel/viewModel.dart';
import 'package:basketball_team_management_flutter/components/listItem.dart';

class EmployeesListWidget extends StatefulWidget {
    const EmployeesListWidget({super.key});

    @override
    State<EmployeesListWidget> createState() => _EmployeesListWidgetState();
}

class _EmployeesListWidgetState extends State<EmployeesListWidget> {
    @override
    Widget build(BuildContext context) {
        final viewModel = Provider.of<EmployeesViewModel>(context);

        return Scaffold(
            appBar: AppBar(title: const Text("Employees"), backgroundColor: CupertinoColors.systemGreen),
            body: viewModel.employees.isNotEmpty ?
                Padding (
                    padding: const EdgeInsets.all(50.0),
                    child: ListView.builder(
                        itemCount: viewModel.employees.length,
                        prototypeItem: ListItem(viewModel.employees.first),
                        itemBuilder: (context, index) {
                            final item = viewModel.employees[index];
                            return ListItem(item);
                        }
                    )
                )
                :
                const Center(child: Text("No employees found")),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    Navigator.pushNamed(context, '/add');
                },
                elevation: 10.0,
                child: const Icon(Icons.add_reaction),
                backgroundColor: CupertinoColors.systemGreen
            )
        );
    }
}
