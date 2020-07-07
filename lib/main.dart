import 'package:bloc_weather_app/View/Home.dart';
import 'package:bloc_weather_app/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherBloc(),
      child: MaterialApp(
        title: 'BLoC Demo',
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
          ),
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[900],
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          body: SearchPage(),
        ),
      ),
    );
  }
}
