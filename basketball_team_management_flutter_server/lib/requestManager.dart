import 'dart:convert';
import 'dart:math';
import 'employee.dart';
import 'package:http/http.dart' as http;

const String url = "http://10.0.2.2:8080/employees";

class RequestManager {
  static Future<Employee> addEmployee(String? name, int? age, String? occupation, int? salary, int? experience) async {
    Random rand = new Random();
    Employee employee = Employee(id: rand.nextInt(9999999), name: name!, age: age!, occupation: occupation!, salary: salary!, experience: experience!);

    final response = await http.post(Uri.parse(url),
        headers: {"content-type": "application/json"},
        body: jsonEncode(employee.toJson()));

    if(response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add Employee");
    }

  }

  static Future<List<Employee>?> getEmployees() async {
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      List<Employee> employees = [];
      List<dynamic> object = jsonDecode(response.body);
      for(int i = 0; i < object.length; i++) {
        employees.add(Employee.fromJson(object[i]));
      }
      return employees;
    }
    else {
      throw Exception("Failed to load Planes");
    }
  }

  static Future<Employee> updateEmployee(int id, String name, int age, String occupation, int salary, int experience) async {
    Employee employee = Employee(id: 0, name: name, age: age, occupation: occupation, salary: salary, experience: experience);

    String completeUrl = "$url/$id";
    final response = await http.put(Uri.parse(completeUrl),
        headers: {"content-type": "application/json"},
        body: jsonEncode(employee.toJson())
    );
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to update Employee");
    }
  }

  static Future<void> deleteEmployee(int id) async {
    String completeUrl = "$url/$id";
    final response = await http.delete(Uri.parse(completeUrl));

    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to delete Employee");
    }
  }
}