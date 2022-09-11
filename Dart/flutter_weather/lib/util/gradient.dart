import 'package:flutter/material.dart';
import 'package:flutter_weather/util/weather.dart';

import 'colors/temperature_colors.dart';
import 'colors/weather_colors.dart';

class GradientUtil {
  GradientUtil._();

  static const _defaultGradient = LinearGradient(colors: [Colors.white70]);

  static LinearGradient getGradiant(Weather? weather, double? temperature) {
    if(temperature == null || weather == null) {
      return _defaultGradient;
    }

    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: const [
        0.7,
        1,
      ],
      colors: [_temperatureColor(temperature), _weatherColor(weather)],
    );
  }

  static Color _weatherColor(Weather weather) {
    switch (weather) {
      case Weather.rain:
      case Weather.thunderstorm:
        return WeatherColors.thunderstorm;
      case Weather.drizzle:
      case Weather.snow:
      case Weather.mist:
      case Weather.smoke:
      case Weather.haze:
      case Weather.dust:
      case Weather.fog:
      case Weather.sand:
      case Weather.ash:
      case Weather.squall:
      case Weather.tornado:
      case Weather.clear:
        return WeatherColors.clear;
      case Weather.clouds:
      default:
        return Colors.grey;
    }
  }

  static Color _temperatureColor(double temperature) {
    if (temperature >= 40) {
      return TemperatureColors.burning;
    } else if (temperature < 40 && temperature >= 30) {
      return TemperatureColors.hot;
    } else if (temperature < 30 && temperature >= 25) {
      return TemperatureColors.warm;
    } else if (temperature < 25 && temperature >= 15) {
      return TemperatureColors.cool;
    } else if (temperature < 15 && temperature >= 0) {
      return TemperatureColors.cold;
    } else {
      return TemperatureColors.freezing;
    }
  }
}
