import 'package:app_clima_tempo/src/modules/weather/domain/errors/weather_exception.dart';
import 'package:app_clima_tempo/src/modules/weather/infra/datasource/weather_datasource.dart';
import 'package:uno/uno.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  final Uno uno;

  WeatherDatasourceImpl(this.uno);

  @override
  Future<Map<String, dynamic>> getWeather(String city) async {
    final response =
        await uno.get('https://goweather.herokuapp.com/weather/$city');

    if (response.status == 200) {
      return response.data;
    } else {
      throw WeatherExceptionDatasource(
          'Erro na requisição', StackTrace.current);
    }
  }
}
