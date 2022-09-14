import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/errors.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/usecases/get_weather_by_city_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:fpdart/fpdart.dart';

class WeatherStore extends NotifierStore<WeatherException, WeatherEntity> {
  final GetWeatherByCityUsecase getWeatherByCityUsecase = Modular.get();

  WeatherStore(
    WeatherEntity initialState,
  ) : super(initialState);
  final String? city = 'Vitoria';

  Future fetchWeather() async {
    try {
      final result = await getWeatherByCityUsecase(city);
      return result.fold((l) => null, (r) => null);
    } catch (e) {
      left(e).toString();
    }
  }
}
