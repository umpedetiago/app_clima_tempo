import 'package:app_clima_tempo/modules/src/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/modules/src/domain/errors/errors.dart';
import 'package:fpdart/fpdart.dart';

abstract class WeatherRepository {
  Future<Either<WeatherException, WeatherEntity>> getWeather();
}
