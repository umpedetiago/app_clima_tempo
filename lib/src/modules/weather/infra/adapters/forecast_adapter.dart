import 'package:app_clima_tempo/src/modules/weather/domain/entities/forecast_entity.dart';

class ForecastAdapter {
  static ForecastEntity fromJson(dynamic data) {
    return ForecastEntity(
      day: data['day'],
      temperature: data['temperature'],
      wind: data['wind'],
    );
  }
}
