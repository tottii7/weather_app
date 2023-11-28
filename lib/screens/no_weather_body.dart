import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            ' there is no weather.. start searching now',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
