import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:basketball_team_management_flutter/viewmodel/viewModel.dart';
import 'package:basketball_team_management_flutter/views/employees_list_view.dart';
import 'package:basketball_team_management_flutter/views/add_employee_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: MultiProvider(
            providers: [
                ChangeNotifierProvider.value(value: EmployeesViewModel())
            ],
            child: MaterialApp(
                title: "BasketballTeamManagement",
                initialRoute: '/',
                routes: {
                    '/': (context) => const EmployeesListWidget(),
                    '/add': (context) => AddEmployeeView(),
                    '/edit': (context) => AddEmployeeView()
                }
            )
        )
    );
  }
}
