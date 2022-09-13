import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';

class WeatherAdapter {
  static WeatherEntity fromJson(dynamic data) {
    return WeatherEntity(
        description: data['description'],
        forecast: data['forecast'],
        temperature: data['temperature'],
        wind: data['wind']);
  }
}
