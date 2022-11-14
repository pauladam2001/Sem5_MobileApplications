import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:basketball_team_management_flutter/models/employee.dart';
import 'package:basketball_team_management_flutter/viewmodel/viewModel.dart';

class AddEmployeeView extends StatefulWidget {
    final occupations = Employee.dummyDataOccupations();
    final Employee? employeeToUpdate;
    
    AddEmployeeView({super.key, this.employeeToUpdate});

    @override
    State<AddEmployeeView> createState() => _AddEmployeeViewState();
}

class _AddEmployeeViewState extends State<AddEmployeeView> {
    final TextEditingController nameController = TextEditingController();
    String? _occupation;
    int? _age;
    int? _experience;
    int? _salary;

    @override
    void initState() {
        super.initState();
        if (widget.employeeToUpdate != null) {
            nameController.text = widget.employeeToUpdate!.name ?? "None";
            setState(() {
                _age = widget.employeeToUpdate!.age;
                _occupation = widget.employeeToUpdate!.occupation;
                _salary = widget.employeeToUpdate!.salary;
                _experience = widget.employeeToUpdate!.experience;
            });
        }
    }

    @override
    Widget build(BuildContext context) {
        final viewModel = Provider.of<EmployeesViewModel>(context);

        return Scaffold(
            appBar: AppBar(
                title: widget.employeeToUpdate == null ? const Text("Add") : const Text("Edit"), backgroundColor: CupertinoColors.systemGreen),
            body: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                    children: [
                        Text(
                            "Name: ",
                            style: const TextStyle(
                                fontSize: 20
                            )
                        ),
                        CupertinoTextField(
                            placeholder: "Name",
                            controller: nameController
                        ),
                        const Spacer(),
                        Row(
                            children: [
                                Text(
                                    "Age: ",
                                    style: const TextStyle(
                                        fontSize: 20
                                    )
                                ),
                                CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () => _showDialog(
                                        CupertinoPicker(
                                            itemExtent: 35.0,
                                            onSelectedItemChanged: (int selectedItem) {
                                                setState(() {
                                                _age = selectedItem + 18;
                                                });
                                            },
                                            children: List<Widget>.generate(48, (int index) {
                                                return Center(
                                                    child: Text("${index + 18}")
                                                );
                                            })
                                        )
                                    ),
                                    child: Text(
                                        _age != null ? "$_age" : "Select",
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            color: CupertinoColors.systemGreen
                                        )
                                    )
                                )
                            ]
                        ),
                        const Spacer(),
                        Row(
                            children: [
                                Text(
                                    "Experience: ",
                                    style: const TextStyle(
                                        fontSize: 20
                                    )
                                ),
                                CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () => _showDialog(
                                        CupertinoPicker(
                                            itemExtent: 35.0,
                                            onSelectedItemChanged: (int selectedItem) {
                                                setState(() {
                                                _experience = selectedItem + 1;
                                                });
                                            },
                                            children: List<Widget>.generate(50, (int index) {
                                                return Center(
                                                    child: Text("${index + 1}")
                                                );
                                            })
                                        )
                                    ),
                                    child: Text(
                                        _experience != null ? "$_experience" : "Select",
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            color: CupertinoColors.systemGreen
                                        )
                                    )
                                )
                            ]
                        ),
                        const Spacer(),
                        Row(
                            children: [
                                Text(
                                    "Salary: ",
                                    style: const TextStyle(
                                        fontSize: 20
                                    )
                                ),
                                CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () => _showDialog(
                                        CupertinoPicker(
                                            itemExtent: 35.0,
                                            onSelectedItemChanged: (int selectedItem) {
                                                setState(() {
                                                _salary = selectedItem * 100;
                                                });
                                            },
                                            children: List<Widget>.generate(40, (int index) {
                                                return Center(
                                                    child: Text("${index * 100}")
                                                );
                                            })
                                        )
                                    ),
                                    child: Text(
                                        _salary != null ? "$_salary" : "Select",
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            color: CupertinoColors.systemGreen
                                        )
                                    )
                                )
                            ]
                        ),
                        const Spacer(),
                        Row(
                            children: [
                                Text(
                                    "Occupation: ",
                                    style: const TextStyle(
                                        fontSize: 20
                                    )
                                ),
                                CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () => _showDialog(
                                        CupertinoPicker(
                                            itemExtent: 35.0,
                                            onSelectedItemChanged: (int selectedItem) {
                                                setState(() {
                                                    _occupation = widget.occupations[selectedItem];
                                                });
                                            },
                                            children: List<Widget>.generate(widget.occupations.length, (int index) {
                                                return Center(
                                                    child: Text(widget.occupations[index])
                                                );
                                            })
                                        )
                                    ),
                                    child: Text(
                                        _occupation ?? "Select",
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            color: CupertinoColors.systemGreen
                                        )
                                    )
                                )
                            ]
                        ),
                        const Spacer(),
                        CupertinoButton(
                            child: Text(
                                widget.employeeToUpdate == null ? 'Add' : 'Edit',
                                style: const TextStyle(color: CupertinoColors.white)
                            ),
                            onPressed: () {
                                updateEmployees(viewModel);
                            },
                            color: CupertinoColors.systemGreen
                        )
                    ]
                )
            )
        );
    }

    void updateEmployees(EmployeesViewModel viewModel) async {
        String name = nameController.text;

        if (name == "" || _age == null || _experience == null || _occupation == null || _salary == null) {
            showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                    title: const Text("Invalid fields"),
                    content: const Text("You must complete all the fields!"),
                    actions: [
                        CupertinoDialogAction(
                            child: const Text("Ok"),
                            onPressed: () {
                                Navigator.of(context).pop();
                            }
                        )
                    ]
                )
            );
            return;
        }

        if (widget.employeeToUpdate == null) {
            viewModel.add(Employee(name: name, age: _age!, occupation: _occupation!, salary: _salary!, experience: _experience!));
        } else {
            widget.employeeToUpdate!.name = name;
            widget.employeeToUpdate!.age = _age!;
            widget.employeeToUpdate!.occupation = _occupation!;
            widget.employeeToUpdate!.salary = _salary!;
            widget.employeeToUpdate!.experience = _experience!;

            viewModel.notifyListeners();
        }

        Navigator.of(context).pop();
    }

    void _showDialog(Widget child) {
        showCupertinoModalPopup<void>(
            context: context,
            builder: (BuildContext context) => Container(
                height: 350,
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                color: CupertinoColors.systemBackground.resolveFrom(context),
                child: SafeArea(top: false, child: child)
            )
        );
    }
}
