class Country{
  String id;
  String name;

  Country({this.id, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
    };
  }

  Country.fromMap(Map<String, dynamic> map):
        id = map['id'],
        name = map['name'];

  @override
  String toString() {
    return 'City{id: $id, name: $name}';
  }

}