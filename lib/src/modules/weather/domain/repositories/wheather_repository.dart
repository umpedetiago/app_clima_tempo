import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/weather_exception.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  WeatherRepository();

  Future<Either<WeatherException, WeatherEntity>> getWeather(String city);
}
