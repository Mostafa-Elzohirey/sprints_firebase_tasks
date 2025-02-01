class Data {
  String id = '';
  String name = '';
  String age = '';
  String hobby = '';

  Data({
    required this.id,
    required this.name,
    required this.age,
    required this.hobby,
  });

  Data.fromMap(Map<dynamic, dynamic> data) {
    id = data["id"];
    name = data["name"];
    age = data["age"];
    hobby = data["hobby"];
  }
}
