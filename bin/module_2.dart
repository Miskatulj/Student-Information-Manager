void main(){

  List<String>studentN1=["Tonmoy","Sakib"];
  List<String>studentN2=["Rahat","Nafis"];

  bool isNewStudent = true;

  List<String>students=[...studentN1, ...studentN2, if(isNewStudent) "Rahim",];


  Set<String>courses={"Flutter","Dart","Git",};

  Map<String,int>studentAges={"Tonmoy":22,"Sakib":23,"Rahat":21,"Nafis":24,"Rahim":20,};

  print("Students:");
  print(students);

  print("\nCourses:");
  print(courses);

  print("\nStudent Ages:");
  studentAges.forEach((name,age){
    print("$name -> $age");
  });
}