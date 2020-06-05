class Department{
  String id;
  String name;

  Department({this.id, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
    };
  }

  Department.fromMap(Map<String, dynamic> map):
        id = map['id'],
        name = map['name'];

  @override
  String toString() {
    return 'City{id: $id, name: $name}';
  }

}