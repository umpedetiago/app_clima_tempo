// ignore_for_file: sized_box_for_whitespace

import 'package:app_clima_tempo/localization.dart';
import 'package:app_clima_tempo/src/modules/weather/domain/errors/weather_exception.dart';
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

Widget _buildError(WeatherException e, BuildContext context) {
  if (e is InvalidCityException) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.errorNotFoundCity,
      ),
    );
  }
  return const SizedBox.shrink();
}

class _WeatherPageState extends State<WeatherPage> {
  final store = Modular.get<WeatherStore>();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Flexible(
            child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            height: 100,
            width: 800,
            child: Text(
              AppLocalizations.of(context)!.weather,
              style: const TextStyle(
                fontSize: 50,
                color: Color.fromARGB(255, 42, 132, 205),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )),
        Flexible(
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
                  onPressed: () => store.fetchWeather(_textController.text),
                  child: Text(AppLocalizations.of(context)!.search)),
            ),
          ),
        ]),
        const SizedBox(
          height: 25,
        ),
        ScopedBuilder(
            store: store,
            onError: (_, e) => _buildError(e as WeatherException, context),
            onLoading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
            onState: (_, state) {
              if (store.state.description.isEmpty) {
                return const SizedBox.shrink();
              }
              return Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: 500,
                    height: 500,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: WeatherWidget(
                              city: _textController.text,
                              wind: store.state.wind,
                              description: store.state.description,
                              temperature: store.state.temperature,
                            ),
                          ),
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: store.state.forecast.length,
                                  itemBuilder: (_, index) {
                                    final item = store.state.forecast[index];
                                    return Card(
                                      child: ListTile(
                                        title: Text(
                                            AppLocalizations.of(context)!.temp +
                                                ': ' +
                                                item.temperature),
                                        leading: Text(
                                            AppLocalizations.of(context)!.day +
                                                ': ' +
                                                item.day),
                                        subtitle: Text(
                                            AppLocalizations.of(context)!.wind +
                                                ': ' +
                                                item.wind),
                                      ),
                                    );
                                  }),
                            ]),
                          ),
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
