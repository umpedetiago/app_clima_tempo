import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/weather_exception.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/repositories/wheather_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetWeatherByCityUsecase {
  Future<Either<WeatherException, WeatherEntity>> call([String? city]);
}

class GetWeatherByCityUsecaseImpl implements GetWeatherByCityUsecase {
  final WeatherRepository repository;

  GetWeatherByCityUsecaseImpl(this.repository);
  @override
  Future<Either<WeatherException, WeatherEntity>> call([String? city]) async {
    if (city == null || city.isEmpty) {
      return Left(InvalidCityException('Cidade invalida', StackTrace.current));
    }
    return await repository.getWeather(city);
  }
}
