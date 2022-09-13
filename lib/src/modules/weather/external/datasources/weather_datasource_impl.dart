import 'package:app_clima_tempo/src/modules/weather/domain/errors/errors.dart';
import 'package:app_clima_tempo/src/modules/weather/infra/datasource/weather_datasource.dart';
import 'package:uno/uno.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  final Uno uno;

  WeatherDatasourceImpl(this.uno);

  @override
  Future getWeather({String? endPoint}) {
    try {
      final response =
          uno.get('https://goweather.herokuapp.com/weather/' + endPoint!);
      return response;
    } catch (e) {
      throw WeatherExceptionDatasource(e.toString());
    }
  }
}