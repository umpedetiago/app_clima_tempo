import 'package:app_clima_tempo/src/modules/weather/infra/adapters/weather_adapter.dart';
// ignore: implementation_imports
import 'package:dartz/dartz.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/errors.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/repositories/wheather_repository.dart';
import 'package:app_clima_tempo/src/modules/weather/infra/datasource/weather_datasource.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDatasource weatherDatasorce;

  WeatherRepositoryImpl(
    this.weatherDatasorce,
  );
  @override
  Future<Either<InvalidCityException, WeatherEntity>> getWeather(city) async {
    try {
      final result = await weatherDatasorce.getWeather(city);
      final weather = WeatherAdapter.fromJson(result);

      return right(weather);
    } on WeatherException catch (e) {
      return left(InvalidCityException(e.message));
    }
  }
}
