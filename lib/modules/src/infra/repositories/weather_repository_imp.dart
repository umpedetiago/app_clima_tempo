import 'package:app_clima_tempo/modules/src/domain/errors/errors.dart';
import 'package:app_clima_tempo/modules/src/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/modules/src/domain/repositories/wheather_repository.dart';
import 'package:app_clima_tempo/modules/src/infra/datasource/weather_datasource.dart';
import 'package:fpdart/src/either.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDatasource weatherDatasorce;

  WeatherRepositoryImpl(this.weatherDatasorce);
  @override
  Future<Either<WeatherException, WeatherEntity>> getWeather() async {
    try {
      final response = await weatherDatasorce.getWeather();

      return right(response);
    } on WeatherException catch (e) {
      return left(e);
    }
  }
}
