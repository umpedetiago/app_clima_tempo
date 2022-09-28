import 'package:app_clima_tempo/src/modules/weather/domain/entities/forecast_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/weather_exception.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/usecases/get_weather_by_city_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class WeatherStore extends NotifierStore<WeatherException, WeatherEntity> {
  final GetWeatherByCityUsecase getWeatherByCityUsecase;

  WeatherStore(
    this.getWeatherByCityUsecase,
  ) : super(WeatherEntity(
            forecast: <ForecastEntity>[],
            wind: '',
            temperature: '',
            description: ''));

  Future<void> fetchWeather(String city) async {
    setLoading(true);

    final result = await getWeatherByCityUsecase(city);

    result.fold(
        (e) => setError(
              e,
            ),
        (state) => update(
              state,
            ));
    setLoading(false);
  }
}
