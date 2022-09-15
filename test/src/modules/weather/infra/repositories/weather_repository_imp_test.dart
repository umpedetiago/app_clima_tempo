import 'dart:convert';

import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/infra/datasource/weather_datasource.dart';
import 'package:app_clima_tempo/src/modules/weather/infra/repositories/weather_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

class WeatherDatasourceMock extends Mock implements WeatherDatasource {}

void main() {
  final datasource = WeatherDatasourceMock();
  final repository = WeatherRepositoryImpl(datasource);
  test('deve retornar um Weather', () async {
    when(() => datasource.getWeather(any()))
        .thenAnswer((_) async => weatherJson);
    final result = await repository.getWeather('vitoria');
    expect(result.fold(id, id), isA<WeatherEntity>());
  });
}

final weatherJson = jsonDecode(
  r'''{
      "temperature":"15 °C","wind":"6 km/h","description":"Partly cloudy","forecast":[{"day":"1","temperature":"+23 °C","wind":"17 km/h"},{"day":"2","temperature":"8 °C","wind":"10 km/h"},{"day":"3","temperature":"11 °C","wind":" km/h"}]} ''',
);
