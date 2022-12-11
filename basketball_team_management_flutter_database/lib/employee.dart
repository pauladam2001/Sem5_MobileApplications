class Employee {
    int id = -1;
    String name = "";
    int age = -1;
    String occupation = "";
    int salary = -1;
    int experience = -1;

    Employee(
        {
            required this.id,
            required this.name,
            required this.age,
            required this.occupation,
            required this.salary,
            required this.experience
        }
    );

    Map<String, dynamic> toMap() {          // dynamic - you can safely re-assign the variable from String to int (for example)
      var map = <String, dynamic> {
        'id': id,
        'name': name,
        'age': age,
        'occupation': occupation,
        'salary': salary,
        'experience': experience
      };

      return map;
    }

    Employee.fromMap(Map<String, dynamic> json) {
      id = json['id'];
      name = json['name'];
      age = json['age'];
      occupation = json['occupation'];
      salary = json['salary'];
      experience = json['experience'];
    }
}