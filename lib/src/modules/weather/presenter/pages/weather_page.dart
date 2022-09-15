import 'package:app_clima_tempo/src/modules/weather/domain/entities/weather_entity.dart';
import 'package:app_clima_tempo/src/modules/weather/presenter/stores/weather_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final store = Modular.get<WeatherStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Clima'),
        ),
        body: Column(children: [
          TextFormField(),
          ElevatedButton(
              onPressed: () {
                store.fetchWeather();
              },
              child: const Text('Pesquisar')),
          ScopedBuilder(
              store: store,
              onError: (_, error) => Text(error.toString()),
              onLoading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
              onState: (_, state) {
                if (store.state.description == null) {
                  return const Text('Insira sua Cidade');
                }
                return Container(
                  width: 400,
                  height: 400,
                  color: Colors.amber,
                  child: Column(children: [Text(store.state.description!)]),
                );
              })
        ]));
  }
}
