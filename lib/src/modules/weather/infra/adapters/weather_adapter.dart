import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/infra/adapters/forecast_adapter.dart';

class WeatherAdapter {
  static WeatherEntity fromJson(dynamic data) {
    return WeatherEntity(
        description: data['description'],
        temperature: data['temperature'],
        wind: data['wind'],
        forecast: (data['forecast'] as List)
            .map((e) => ForecastAdapter.fromJson(e))
            .toList());
  }
}
