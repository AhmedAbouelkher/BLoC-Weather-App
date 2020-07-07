import 'package:bloc_weather_app/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';

class TextField extends StatefulWidget {
  final Function(String) onSearch;
  final WeatherBloc weatherProvider;
  TextField({Key key, this.onSearch, this.weatherProvider}) : super(key: key);

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Search Weather",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.white70),
          ),
          Text(
            "Instanly",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w200,
                color: Colors.white70),
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: _textEditingController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white70,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: Colors.white70,
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: Colors.blue,
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              hintText: "City Name",
              hintStyle: TextStyle(color: Colors.white70),
            ),
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              onPressed: () {
                widget.weatherProvider.add(
                  LoadWeather(
                    cityName: _textEditingController.text.toLowerCase().trim(),
                  ),
                );
                widget
                    .onSearch(_textEditingController.text.toLowerCase().trim());
              },
              color: Colors.lightBlue,
              child: Text(
                "Search",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
