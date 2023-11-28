import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_appp/screens/home_view.dart';
import 'package:weather_appp/screens/search_view.dart';
import 'package:weather_appp/screens/weather_info_body.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == 'Fog') {
    return Colors.lightBlue;
  } else if (condition == 'Sunny') {
    return Colors.orange;
  } else if (condition == 'Blizzard') {
    return Colors.lightBlue;
  } else if (condition == 'Light rain') {
    return Colors.lightBlue;
  } else if (condition == 'Heavy snow') {
    return Colors.grey;
  } else if (condition == 'Cloudy') {
    return Colors.blueGrey;
  } else if (condition == 'Partly cloudy') {
    return Colors.blueGrey;
  } else if (condition == 'Overcast') {
    return Colors.grey;
  } else if (condition == 'Mist') {
    return Colors.grey;
  } else {
    return Colors.blue;
  }
}
