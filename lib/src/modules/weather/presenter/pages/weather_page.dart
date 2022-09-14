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
      body: ScopedBuilder(
        store: store,
        onError: (context, error) => Text(error.toString()),
        onLoading: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        onState: (context, state) {
          return Column(children: [
            TextFormField(),
            ElevatedButton(
                onPressed: store.getWeatherByCityUsecase,
                child: const Text('Pesquisar')),
            Container(
              width: 400,
              height: 400,
              color: Colors.amber,
              child: Column(
                  children: [Text(store.state.description ?? 'Texto teste')]),
            )
          ]);
        },
      ),
    );
  }
}
