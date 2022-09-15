import 'package:app_clima_tempo/src/modules/weather/domain/errors/errors.dart';
import 'package:app_clima_tempo/src/modules/weather/infra/datasource/weather_datasource.dart';
import 'package:uno/uno.dart';

class WeatherDatasourceImpl implements WeatherDatasource {
  final Uno uno;

  WeatherDatasourceImpl(this.uno);

  @override
  Future getWeather(String city) async {
    try {
      final response =
          await uno.get('https://goweather.herokuapp.com/weather/' + city);

      return response.data;
    } catch (e) {
      WeatherExceptionDatasource(e.toString());
    }
  }
}
