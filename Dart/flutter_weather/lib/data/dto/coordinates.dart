class Coordinates {
  Coordinates({required this.lat, required this.lon});

  final double lat;
  final double lon;

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(lat: json["lat"], lon: json["lon"]);
  }
}
