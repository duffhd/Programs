/// WeatherDto is the current weather name and description, it also
/// comes with id and icon, which are not captured.
/// Full Json example:
///{
///     "id": 804,
///     "main": "Clouds",
///     "description": "overcast clouds",
///     "icon": "04d"
///}
/// It comes inside a list.
class WeatherDto {
  final String main;
  final String description;

  WeatherDto({required this.main, required this.description});

  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
    WeatherDto(
        main: json["main"] ?? "",
        description: json["description"] ?? ""
    );
}