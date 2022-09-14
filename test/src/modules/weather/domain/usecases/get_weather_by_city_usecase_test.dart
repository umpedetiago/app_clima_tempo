import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/errors.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/repositories/wheather_repository.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/usecases/get_weather_by_city_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class WeatherRepositoryMock extends Mock implements WeatherRepository {}

void main() {
  final repository = WeatherRepositoryMock();
  final usecase = GetWeatherByCityUsecaseImpl(repository);
  test('Deve retornar um WeatherEntity', (() async {
    when(
      () => repository.getWeather(any()),
    ).thenAnswer((_) async => right(WeatherEntity()));
    final result = await usecase('Vitoria');
    expect(result.fold(id, id), isA<WeatherEntity>());
  }));
  test('Deve retornar um InvalidCityError', (() async {
    when(
      () => repository.getWeather(any()),
    ).thenAnswer((_) async => right(WeatherEntity()));
    final result = await usecase(null);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidCityError>());
  }));
}