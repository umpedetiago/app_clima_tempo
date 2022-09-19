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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Weather at ' + city),
        Text('Wind: ' + wind),
        Flexible(flex: 2, child: Text('Description:' + description)),
        Text('Temperature:' + temperature),
      ],
    );
  }
}
