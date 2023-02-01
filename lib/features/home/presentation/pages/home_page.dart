import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/home/presentation/bloc/weather_cubit.dart';
import 'weather_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WeatherCubit>(
            create: (context) => WeatherCubit(),
          ),
        ],
        child: Scaffold(
          body: WeatherScreen(),
        ));
  }
}
