import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/errors.dart';
import 'package:fpdart/fpdart.dart';

abstract class WeatherRepository {
  WeatherRepository();

  Future<Either<WeatherException, WeatherEntity>> getWeather();
}
