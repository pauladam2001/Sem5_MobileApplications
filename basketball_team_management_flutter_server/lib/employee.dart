class Employee {
  int id = 0;
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

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'age': age,
      'occupation': occupation,
      'salary': salary,
      'experience': experience
  };

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      occupation: json['occupation'],
      salary: json['salary'],
      experience: json['experience']
  );
}