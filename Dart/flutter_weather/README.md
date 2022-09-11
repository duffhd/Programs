# flutter_weather
Flutter weather is a simple app that uses OpenWeatherAPI to retrieve the current weather on a given city.
Each city is displayed inside a card with a gradient color, the left portion of the color represents the
current weather like, clear, rain, clouds... and the right side portion of the card represents the current
temperature on the city.

## Getting Started
To correctly use this app you need to place a file called `api_key.dart` inside the `lib/util/` package
and add your OpenWeather API key. To create a key you'll need to register into the OpenWeather
[website](https://openweathermap.org/) and request a key.

Once you received it the file you need to create should look like:
```dart
String getApiKey() {
  return "paste your key here";
}
```