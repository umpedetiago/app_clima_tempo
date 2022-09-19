import 'package:app_clima_tempo/localization.dart';
import 'package:flutter/material.dart';

class WeatherTextField extends StatelessWidget {
  const WeatherTextField({
    Key? key,
    required TextEditingController textController,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: AppLocalizations.of(context)!.inputCity,
      ),
      controller: _textController,
    );
  }
}
