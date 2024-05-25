class Weather {
  final String description;
  final double temperature;
  final double feels_like;
  final int pressure;
  final int humidity;
  final String name;

  Weather( {required this.feels_like,
    required this.description,
    required this.temperature,
    required this.pressure,
    required this.humidity,
    required this.name,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        description: json['weather'][0]['description'],
        temperature: json['main']['feels_like'],
        feels_like: json['main']['temp'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        name: json['name']);
  }
}
