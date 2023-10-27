import 'package:team_track_app/features/employees/domain/entities/employee.dart';

class EmployeeModel extends Employee {
  EmployeeModel({
    required super.id,
    required super.name,
    required super.surname,
    required super.salary,
    // required super.department,
    // required super.position,
    // required super.adress,
    // super.birthDate,
    // super.hireDate,
    // super.leavhDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'salary': salary,
      // 'department': department,
      // 'position': position,
      // 'adress': adress,
      // 'birthDate': birthDate?.millisecondsSinceEpoch,
      // 'hireDate': hireDate?.millisecondsSinceEpoch,
      // 'leavhDate': leavhDate?.millisecondsSinceEpoch,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      salary: map['salary'] ?? -1,
      // department: map['department'] ?? '',
      // position: map['position'] ?? '',
      // adress: map['adress'] ?? '',
      // birthDate: map['birthDate'] != null
      //     ? DateTime.fromMillisecondsSinceEpoch(map['birthDate'])
      //     : null,
      // hireDate: map['hireDate'] != null
      //     ? DateTime.fromMillisecondsSinceEpoch(map['hireDate'])
      //     : null,
      // leavhDate: map['leavhDate'] != null
      //     ? DateTime.fromMillisecondsSinceEpoch(map['leavhDate'])
      //     : null,
    );
  }
}
