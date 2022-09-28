abstract class WeatherDatasource {
  Future<Map<String, dynamic>> getWeather(String city);
}
