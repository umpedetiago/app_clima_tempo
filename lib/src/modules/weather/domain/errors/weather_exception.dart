abstract class WeatherException {
  final String message;
  final StackTrace stacktrace;

  const WeatherException(this.message, this.stacktrace);
}

class InvalidCityException extends WeatherException {
  InvalidCityException(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}

class WeatherExceptionDatasource extends WeatherException {
  WeatherExceptionDatasource(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}
