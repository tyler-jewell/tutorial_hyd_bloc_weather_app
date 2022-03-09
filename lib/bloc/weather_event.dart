part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class GetWeather extends WeatherEvent {
  GetWeather(this.cityName);
  final String cityName;
}
