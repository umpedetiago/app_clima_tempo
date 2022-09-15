abstract class WeatherException {
  final String message;
  final String? stacktrace;

  const WeatherException(this.message, [this.stacktrace]);
}

class InvalidCityException extends WeatherException {
  InvalidCityException(String message) : super(message);
}

class WeatherExceptionDatasource extends WeatherException {
  WeatherExceptionDatasource(String message) : super(message);
}
