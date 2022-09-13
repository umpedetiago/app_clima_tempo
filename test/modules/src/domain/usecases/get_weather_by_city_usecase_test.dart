import 'dart:ui';

import 'package:app_clima_tempo/modules/src/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/modules/src/domain/repositories/wheather_repository.dart';
import 'package:app_clima_tempo/modules/src/domain/usecases/get_weather_by_city_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class WeatherRepositoryMock extends Mock implements WeatherRepository {}

void main() {
  final repository = WeatherRepositoryMock();
  final usecase = GetWeatherByCityUsecaseImpl(repository);
  test('Deve retornar um WeatherEntity', (() async {
    when(
      () => repository.getWeather(),
    ).thenAnswer((_) async => right(WeatherEntity()));
    final result = await usecase();
    expect(result.fold(id, id), isA<WeatherEntity>());
  }));
}
