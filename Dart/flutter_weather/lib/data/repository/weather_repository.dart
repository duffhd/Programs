import 'dart:convert';

import 'package:flutter_weather/data/urls.dart';
import 'package:http/http.dart' as http;

import '../../util/api_key.dart';
import '../dto/coordinates.dart';
import '../dto/current_weather_dto.dart';
import '../dto/location_dto.dart';

class WeatherRepository {
  Future<CurrentWeatherDto> getCurrentWeather(Coordinates location) async {
    var url = Uri.http(WeatherUrl.openWeatherUrl, WeatherUrl.currentWeather, {
      "lat": location.lat.toString(),
      "lon": location.lon.toString(),
      "units": "metric",
      "appid": getApiKey()
    });

    var response = await http.get(url);
    var decoded = jsonDecode(response.body);
    return CurrentWeatherDto.fromJson(decoded);
  }

  Future<LocationDto> getCityCoordinates(String cityName) async {
    var url = Uri.http(WeatherUrl.openWeatherUrl, WeatherUrl.geolocationApi,
        {"q": cityName, "appid": getApiKey()});

    var response = await http.get(url);
    var decoded = jsonDecode(response.body);
    return LocationDto.fromJson(decoded);
  }
}
