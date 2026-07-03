import 'dart:io';

abstract class Person {
  void displayInfo();
}

class Student extends Person {
  String _name;
  int _id;
  String _department;

  Student(this._name, this._id, this._department);

  String get name => _name;
  int get id => _id;
  String get department => _department;

  @override
  void displayInfo() {
    print("\nStudent Information");
    print("Name : $_name");
    print("ID : $_id");
    print("Department : $_department");
  }
}

List<Student> students = [];

void showTitle() => print("\n===== Student Information Manager =====");

void addStudent() {
  print("\nEnter Student Name:");
  String name = stdin.readLineSync()!;

  print("Enter Student ID:");
  int id = int.parse(stdin.readLineSync()!);

  print("Enter Department:");
  String department = stdin.readLineSync()!;

  Student student = Student(name, id, department);
  students.add(student);

  print("\nStudent Added Successfully!");
}

void viewStudents() {
  if (students.isEmpty) {
    print("\nNo Students Found.");
    return;
  }

  print("\nStudent List");

  students.forEach((student) {
    student.displayInfo();
  });
}

void searchStudent() {
  if (students.isEmpty) {
    print("\nNo Students Available.");
    return;
  }

  print("\nEnter Student ID to Search:");
  int id = int.parse(stdin.readLineSync()!);

  bool found = false;

  for (Student student in students) {
    if (student.id == id) {
      print("\nStudent Found!");
      student.displayInfo();
      found = true;
      break;
    }
  }

  if (!found) {
    print("\nStudent Not Found.");
  }
}

void deleteStudent() {
  if (students.isEmpty) {
    print("\nNo Students Available.");
    return;
  }

  print("\nEnter Student ID to Delete:");
  int id = int.parse(stdin.readLineSync()!);

  int before = students.length;

  students.removeWhere((student) => student.id == id);

  if (students.length < before) {
    print("\nStudent Deleted Successfully!");
  } else {
    print("\nStudent Not Found.");
  }
}

void main() {
  while (true) {
    showTitle();

    print("1. Add Student");
    print("2. View Students");
    print("3. Search Student");
    print("4. Delete Student");
    print("5. Exit");

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        addStudent();
        break;

      case 2:
        viewStudents();
        break;

      case 3:
        searchStudent();
        break;

      case 4:
        deleteStudent();
        break;

      case 5:
        print("\nThank You!");
        return;

      default:
        print("\nInvalid Choice!");
    }
  }
}