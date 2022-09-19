import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/errors.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/usecases/get_weather_by_city_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class WeatherStore extends NotifierStore<WeatherException, WeatherEntity> {
  final GetWeatherByCityUsecase getWeatherByCityUsecase;

  WeatherStore(
    this.getWeatherByCityUsecase,
  ) : super(WeatherEntity());

  Future<void> fetchWeather(String city) async {
    setLoading(true);
    await getWeatherByCityUsecase(city).then((value) {
      value.fold(
          (e) => setError(
                e,
                force: true,
              ),
          (state) => update(
                state,
                force: true,
              ));
      setLoading(false);
    });
  }
}
