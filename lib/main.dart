import 'package:app_clima_tempo/src/modules/weather/app_widget.dart';
import 'package:app_clima_tempo/src/modules/weather/weather_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  return runApp(ModularApp(module: WeatherModule(), child: const AppWidget()));
}
