import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';

abstract class WeatherDatasource {
  Future getWeather({required String endPoint});
}
