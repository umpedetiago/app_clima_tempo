// ignore: implementation_imports
import 'package:fpdart/src/either.dart';

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
  Future<Either<InvalidCityError, WeatherEntity>> getWeather(endpoint) async {
    try {
      final result = await weatherDatasorce.getWeather(endPoint: endpoint!);

      return result;
    } on WeatherException catch (e) {
      return Left(InvalidCityError(e.message));
    }
  }
}
