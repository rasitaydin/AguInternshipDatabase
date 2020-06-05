class Interests{
  String id;
  String name;

  Interests({this.id, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
    };
  }

  Interests.fromMap(Map<String, dynamic> map):
        id = map['id'],
        name = map['name'];

  @override
  String toString() {
    return 'City{id: $id, name: $name}';
  }

}