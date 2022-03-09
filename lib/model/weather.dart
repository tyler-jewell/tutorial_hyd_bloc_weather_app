import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable {
  const Weather({
    required this.cityName,
    required this.temperature,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  final String cityName;
  final double temperature;

  @override
  List<Object?> get props => [cityName, temperature];

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
