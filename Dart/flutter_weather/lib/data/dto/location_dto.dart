import 'coordinates.dart';

class LocationDto {
  LocationDto({required this.cities});

  final List<Coordinates> cities;

  factory LocationDto.fromJson(List<dynamic> jsonList) {
    return LocationDto(cities: List<Coordinates>.from(
        jsonList.map((coord) => Coordinates.fromJson(coord))));
  }
}
