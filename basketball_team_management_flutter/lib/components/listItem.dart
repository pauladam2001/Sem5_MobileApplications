import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:basketball_team_management_flutter/viewmodel/viewModel.dart';
import 'package:basketball_team_management_flutter/models/employee.dart';
import 'package:basketball_team_management_flutter/views/add_employee_view.dart';

class ListItem extends StatelessWidget {
    final Employee employee;

    const ListItem(this.employee, {super.key});

    @override
    Widget build(BuildContext context) {
        final viewModel = Provider.of<EmployeesViewModel>(context);

        return Container(
            height: 100,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Column(
                        children: [
                            Text(
                                employee.name,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                )
                            )
                        ]
                    ),
                    const Spacer(),
                    Column(
                        children: [
                            Text(
                                "${employee.age} years old",
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
                                employee.occupation,
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
                                "${employee.salary}\$",
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
                            size: 30
                        ),
                        onTap: () => update(context, viewModel, employee)
                    ),
                    GestureDetector(
                        child: const Icon(
                            CupertinoIcons.trash_circle,
                            size: 30
                        ),
                        onTap: () => delete(context, viewModel, employee.id)
                    )
                ]
            )
        );
    }

    void delete(BuildContext context, EmployeesViewModel viewModel, String employeeId) {
        showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
                title: const Text("Delete"),
                content: const Text("Are you sure you want to delete this employee?"),
                actions: [
                    CupertinoDialogAction(
                        child: const Text("No"),
                        onPressed: () {
                            Navigator.of(context).pop();
                        }
                    ),
                    CupertinoDialogAction(
                        child: const Text("Yes"),
                        onPressed: () {
                            viewModel.employees = viewModel.employees.where((employee) => employee.id != employeeId).toList();
                            Navigator.of(context).pop();
                        }
                    )
                ]
            )
        );
    }

    void update(BuildContext context, EmployeesViewModel viewModel, Employee employee) {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
                value: viewModel,
                child: AddEmployeeView(employeeToUpdate: employee)
            )
        ));
    }
}
