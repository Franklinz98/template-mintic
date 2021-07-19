class UserLocation {
  String name, type;
  int distance;

  UserLocation({
    required this.name,
    required this.type,
    required this.distance,
  });

  factory UserLocation.fromJson(Map<String, dynamic> map) {
    return UserLocation(
        name: map['name'],
        type: map['type'].toString(),
        distance: map['distance']);
  }
}

class MyLocation {
  String name, id;
  String? type, qtype;
  double lat, long;
  int? distance;

  MyLocation(
      {required this.name,
      required this.id,
      required this.lat,
      required this.long,
      this.distance,
      this.type,
      this.qtype});

  Map get toJson {
    return {
      "name": this.name,
      "id": this.id,
      "lat": this.lat,
      "long": this.long,
      "dist": this.distance,
      "type": this.type,
      "qtype": this.qtype
    };
  }
}
