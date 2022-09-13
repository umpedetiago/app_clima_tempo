import 'package:app_clima_tempo/src/modules/weather/domain/repositories/wheather_repository.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/usecases/get_weather_by_city_usecase.dart';
import 'package:app_clima_tempo/src/modules/weather/external/datasources/weather_datasource_impl.dart';
import 'package:app_clima_tempo/src/modules/weather/infra/datasource/weather_datasource.dart';
import 'package:app_clima_tempo/src/modules/weather/infra/repositories/weather_repository_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => Uno()),
        Bind.factory<WeatherRepository>((i) => WeatherRepositoryImpl(i())),
        Bind.factory<GetWeatherByCityUsecase>(
            (i) => GetWeatherByCityUsecaseImpl(i())),
        Bind.factory<WeatherDatasource>((i) => WeatherDatasourceImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [];
}
