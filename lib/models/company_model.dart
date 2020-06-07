class Company{
  String id;
  String name;

  Company({this.id, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
    };
  }

  Company.fromMap(Map<String, dynamic> map):
        id = map['id'].toString(),
        name = map['name'];

  @override
  String toString() {
    return 'City{id: $id, name: $name}';
  }

}