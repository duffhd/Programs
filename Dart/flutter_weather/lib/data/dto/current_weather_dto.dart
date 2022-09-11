import 'package:flutter_weather/data/dto/weather_dto.dart';

import 'main_dto.dart';

class CurrentWeatherDto {
  final MainDto main;
  final List<WeatherDto> weather;
  final String name;

  CurrentWeatherDto(
      {required this.main, required this.weather, required this.name});

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherDto(
          main: MainDto.fromJson(json["main"]),
          weather: List<WeatherDto>.from(
              json["weather"].map((weather) => WeatherDto.fromJson(weather))),
          name: json["name"] ?? "");
}
