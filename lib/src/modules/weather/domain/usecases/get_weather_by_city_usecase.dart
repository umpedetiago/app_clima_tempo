import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/errors.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/repositories/wheather_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class GetWeatherByCityUsecase {
  Future<Either<InvalidCityError, WeatherEntity>> call([String? params]);
}

class GetWeatherByCityUsecaseImpl implements GetWeatherByCityUsecase {
  final WeatherRepository repository;

  GetWeatherByCityUsecaseImpl(this.repository);
  @override
  Future<Either<InvalidCityError, WeatherEntity>> call([String? params]) async {
    if (params == null) {
      return Left(InvalidCityError('Cidade invalida'));
    }
    return await repository.getWeather(params);
  }
}
