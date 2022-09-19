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
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      controller: _textController,
    );
  }
}
