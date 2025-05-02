class FlightSuggestion {
  final String cityCode;
  final String cityName;
  final String airportName;
  final String countryName;

  FlightSuggestion({
    required this.cityCode,
    required this.cityName,
    required this.airportName,
    required this.countryName,
  });

  factory FlightSuggestion.fromJson(Map<String, dynamic> json) {
    return FlightSuggestion(
      cityCode: json['cityCode'],
      cityName: json['cityName'],
      airportName: json['airportName'],
      countryName: json['countryName'],
    );
  }
}
