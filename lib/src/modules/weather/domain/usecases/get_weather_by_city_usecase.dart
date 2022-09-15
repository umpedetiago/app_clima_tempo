import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/errors.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/repositories/wheather_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetWeatherByCityUsecase {
  Future<Either<InvalidCityException, WeatherEntity>> call([String? city]);
}

class GetWeatherByCityUsecaseImpl implements GetWeatherByCityUsecase {
  final WeatherRepository repository;

  GetWeatherByCityUsecaseImpl(this.repository);
  @override
  Future<Either<InvalidCityException, WeatherEntity>> call(
      [String? city]) async {
    if (city == null || city.isEmpty) {
      return Left(InvalidCityException('Cidade invalida'));
    }
    return await repository.getWeather(city);
  }
}
