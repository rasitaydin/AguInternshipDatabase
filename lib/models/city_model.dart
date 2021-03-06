class City{
  String id;
  String name;
  String countryID;

  City({this.id, this.name, this.countryID});

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
      'country_id' : countryID,
    };
  }

  City.fromMap(Map<String, dynamic> map):
    id = map['id'].toString(),
    name = map['name'],
    countryID = map['country_id'].toString();

  @override
  String toString() {
    return 'City{id: $id, name: $name, country_id: $countryID}';
  }

}