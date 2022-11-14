import 'package:flutter/cupertino.dart';
import 'package:basketball_team_management_flutter/models/employee.dart';

class EmployeesViewModel extends ChangeNotifier {
    List<Employee> _employees = [Employee.dummyData1(), Employee.dummyData2(), Employee.dummyData3()];

    List<Employee> get employees => _employees;

    set employees(List<Employee> employees) {
        _employees = employees;
        notifyListeners();
    }

    void add(Employee newEmployee) {
        _employees.add(newEmployee);
        notifyListeners();
    }
}