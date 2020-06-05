class ContactType{
  String id;
  String name;

  ContactType({this.id, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
    };
  }

  ContactType.fromMap(Map<String, dynamic> map):
        id = map['id'],
        name = map['name'];

  @override
  String toString() {
    return 'City{id: $id, name: $name}';
  }

}