import 'package:app_clima_tempo/localization.dart';
import 'package:flutter/material.dart';

import '../../../stores/weather_store.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    Key? key,
    required this.wind,
    required this.description,
    required this.temperature,
    required this.city,
  }) : super(key: key);

  final String wind;
  final String description;
  final String temperature;
  final String city;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(AppLocalizations.of(context)!.weatherAt + ' ' + city),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(AppLocalizations.of(context)!.wind + ': ' + wind),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
                AppLocalizations.of(context)!.description + ':' + description),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: Text(AppLocalizations.of(context)!.temp + ':' + temperature),
          ),
        ],
      ),
    );
  }
}
