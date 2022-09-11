/// MainDTO describes the current temperature and attributes like
/// humidity, minimum temperature... most of this is not captured.
/// Full Json response example:
/// "main": {
///     "temp": 25.8,
///     "feels_like": 26.32,
///     "temp_min": 25.8,
///     "temp_max": 27.55,
///     "pressure": 1016,
///     "humidity": 72
/// },
class MainDto {
  final double? temp;

  MainDto({required this.temp});

  factory MainDto.fromJson(Map<String, dynamic> json) =>
      MainDto(temp: json['temp']);
}
