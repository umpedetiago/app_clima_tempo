import 'package:app_clima_tempo/modules/src/domain/entities/forecast_entity.dart';

class WeatherEntity {
  final String? wind;
  final String? temperature;
  final String? description;
  final List<ForecastEntity?>? forecast;

  WeatherEntity({
    this.forecast,
    this.wind,
    this.temperature,
    this.description,
  });
}
