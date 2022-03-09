import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tutorial_hyd_bloc_weather_app/model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends HydratedBloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeather>((event, emit) async {
      emit(WeatherLoading());
      final weather = await fetchWeather(event.cityName);
      emit(WeatherLoaded(weather));
    });
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    try {
      final weather = Weather.fromJson(json);
      return WeatherLoaded(weather);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WeatherState state) {
    if (state is WeatherLoaded) {
      return state.weather.toJson();
    } else {
      return null;
    }
  }
}

Future<Weather> fetchWeather(String cityName) {
  return Future.delayed(
    const Duration(seconds: 1),
    () {
      return Weather(
        cityName: cityName,
        temperature: 20,
      );
    },
  );
}
