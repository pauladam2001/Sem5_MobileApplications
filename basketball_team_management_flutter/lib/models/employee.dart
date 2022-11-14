import 'package:uuid/uuid.dart';

class Employee {
    final String id = const Uuid().v4();
    String name;
    int age;
    String occupation;
    int salary;
    int experience;

    Employee(
        {
            required this.name,
            required this.age,
            required this.occupation,
            required this.salary,
            required this.experience
        }
    );

    static Employee dummyData1() {
        return Employee(name: "Paul", age: 21, occupation: "coach", salary: 3000, experience: 12);
    }

    static Employee dummyData2() {
        return Employee(name: "Dan", age: 22, occupation: "coach", salary: 2000, experience: 5);
    }

    static Employee dummyData3() {
        return Employee(name: "Alex", age: 20, occupation: "player", salary: 1200, experience: 4);
    }

    static List<String> dummyDataOccupations() {
        return ["coach", "player", "physical trainer"];
    }
}