class Post{
  late String name;
  late int salary;
  late int age;
  late int id;


  Post({required this.name, required this.salary, required this.age, required this.id});

  Post.fromJson(Map < String, dynamic > json)
      : name = json ['name'] ,
        salary = json ['salary'],
        age = json ['age'],
        id = json ['id'];



  Map<String, dynamic > toJson()=> {
    'name' : name ,
    'salary' : age ,
    'age': age,
    'id': id,
  };
}