import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/data/dto/current_weather_dto.dart';
import 'package:flutter_weather/util/weather.dart';

import '../util/date.dart';
import '../util/extensions/string_extension.dart';
import '../util/gradient.dart';
import 'style/text_style.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    Key? key,
    required this.weatherInfo,
  }) : super(key: key);

  final CurrentWeatherDto weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(1, 1),
              ),
            ],
            gradient: GradientUtil.getGradiant(
                EnumToString.fromString(
                    Weather.values, weatherInfo.weather.first.main),
                weatherInfo.main.temp)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(weatherInfo.name,
                    style: WeatherTextStyle.biggerCardText),
              ),
              Column(
                children: [
                  Text(weatherInfo.main.temp?.toDegrees() ?? "",
                      style: WeatherTextStyle.biggerCardText),
                  Text(DateUtil.getDayMonth(),
                      style: WeatherTextStyle.dateCardText)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
