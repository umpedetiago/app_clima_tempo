import 'dart:io';

import 'package:app_clima_tempo/src/modules/weather/domain/errors/errors.dart';
import 'package:app_clima_tempo/src/modules/weather/external/datasources/weather_datasource_impl.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';

class UnoMock extends Mock implements Uno {}

void main() {
  final uno = UnoMock();
  final datasource = WeatherDatasourceImpl(uno);
  test('Deve retornar um Map', () {
    when(() => uno.get(any())).thenAnswer((_) async => Response(
        headers: {},
        request: Request(
            headers: {},
            method: 'GET',
            timeout: const Duration(milliseconds: 5),
            uri: Uri.http('https://goweather.herokuapp.com/weather/Vitoria')),
        status: 200,
        data: {}));
    final future = datasource.getWeather('Vitoria');
    expect(future, completes);
  });
}
