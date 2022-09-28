import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/weather_exception.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/repositories/wheather_repository.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/usecases/get_weather_by_city_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

class WeatherRepositoryMock extends Mock implements WeatherRepository {}

class WeatherEntityMock extends Mock implements WeatherEntity {}

void main() {
  final repository = WeatherRepositoryMock();
  final usecase = GetWeatherByCityUsecaseImpl(repository);
  test('Deve retornar um WeatherEntity', () async {
    when(
      () => repository.getWeather(any()),
    ).thenAnswer((_) async => right(WeatherEntityMock()));
    final result = await usecase('Vitoria');
    expect(result.fold(id, id), isA<WeatherEntity>());
  });
  test('Deve retornar um InvalidCityError', (() async {
    var result = await usecase(null);
    expect(result.fold(id, id), isA<InvalidCityException>());
    result = await usecase('');
    expect(result.fold(id, id), isA<InvalidCityException>());
  }));
}
