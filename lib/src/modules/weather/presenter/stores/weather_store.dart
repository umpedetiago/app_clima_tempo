import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/errors.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/usecases/get_weather_by_city_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:dartz/dartz.dart';

class WeatherStore extends NotifierStore<WeatherException, WeatherEntity> {
  final GetWeatherByCityUsecase getWeatherByCityUsecase = Modular.get();

  WeatherStore(
    WeatherEntity entity,
  ) : super(entity);
  final String? city = 'Vitoria';

  Future<void> fetchWeather() async {
    setLoading(true);
    await getWeatherByCityUsecase(city).then((value) {
      if (value is EitherAdapter<WeatherException, WeatherEntity>) {
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
      }
    });
  }
}
