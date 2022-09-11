import 'package:flutter_weather/data/repository/weather_repository.dart';
import 'package:get/get.dart';

import '../../widgets/city_card.dart';

class HomeController extends GetxController {
  HomeController({required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  final WeatherRepository _weatherRepository;
  final List<CityCard> cityCards = <CityCard>[].obs;

  Future<void> addCity(String? city) async {
    if (city == null) return;

    var cityCoordinates = await _weatherRepository.getCityCoordinates(city);
    if (cityCoordinates.cities.isEmpty) return;

    var currentWeather =
        await _weatherRepository.getCurrentWeather(cityCoordinates.cities[0]);
    var cityCard = CityCard(weatherInfo: currentWeather);

    cityCards.add(cityCard);
  }
}
