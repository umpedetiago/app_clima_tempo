import 'package:app_clima_tempo/src/modules/weather/domain/errors/errors.dart';
import 'package:app_clima_tempo/src/modules/weather/presenter/pages/weather/widget/weather_textfield.dart';
import 'package:app_clima_tempo/src/modules/weather/presenter/pages/weather/widget/weather_widget.dart';
import 'package:app_clima_tempo/src/modules/weather/presenter/stores/weather_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

Widget _buildError(WeatherException e) {
  if (e is InvalidCityException) {
    return const Center(
      child: Text(
        'cidade não encontrada',
      ),
    );
  }
  return SizedBox.shrink();
}

class _WeatherPageState extends State<WeatherPage> {
  final store = Modular.get<WeatherStore>();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Flexible(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  height: 100,
                  width: 800,
                  child: const Text(
                    'Climão',
                    style: TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 42, 132, 205),
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            Flexible(
              flex: 1,
              child: SizedBox(
                width: 800,
                child: WeatherTextField(textController: _textController),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        store.fetchWeather(_textController.text);
                      },
                      child: const Text('Pesquisar')),
                ),
              ),
            ]),
            const SizedBox(
              height: 25,
            ),
            ScopedBuilder(
                store: store,
                onError: (_, e) => _buildError(e as WeatherException),
                onLoading: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                onState: (_, state) {
                  if (store.state.description == null) {
                    return const Text('Insira sua Cidade');
                  }
                  return Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        width: 500,
                        height: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: WeatherWidget(
                                  city: _textController.text,
                                  wind: store.state.wind!,
                                  description: store.state.description!,
                                  temperature: store.state.temperature!,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Column(children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: store.state.forecast!.length,
                                    itemBuilder: (_, index) {
                                      final item = store.state.forecast![index];
                                      return Card(
                                        child: ListTile(
                                          title: Text(
                                              'Temp: ' + item.temperature!),
                                          leading: Text('Day: ' + item.day!),
                                          subtitle: Text('Wind: ' + item.wind!),
                                        ),
                                      );
                                    }),
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ]),
        ));
  }
}
