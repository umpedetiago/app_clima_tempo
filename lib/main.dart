import 'package:app_clima_tempo/app/app_module.dart';
import 'package:app_clima_tempo/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
