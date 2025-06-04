class DestinationFare {
  final String from;
  final String to;
  final String destFromName;
  final String destToName;
  final double grandTotal;
  final String classType;
  final String classCode;
  final String airlineName;
  final String airlineCode;
  final String travelDateStart;
  final String travelDateEnd;
  final String continentName;
  final String country;

  DestinationFare({
    required this.from,
    required this.to,
    required this.destFromName,
    required this.destToName,
    required this.grandTotal,
    required this.classType,
    required this.classCode,
    required this.airlineName,
    required this.airlineCode,
    required this.travelDateStart,
    required this.travelDateEnd,
    required this.continentName,
    required this.country,
  });

  factory DestinationFare.fromJson(Map<String, dynamic> json) {
    return DestinationFare(
      from: json['From'] ?? '',
      to: json['To'] ?? '',
      destFromName: json['DestfromName'] ?? '',
      destToName: json['DesttoName'] ?? '',
      grandTotal: (json['GrandTotal'] ?? 0.0).toDouble(),
      classType: json['ClassType'] ?? '',
      classCode: json['Class'] ?? '',
      airlineName: json['Airline_Name'] ?? '',
      airlineCode: json['Airline_Code'] ?? '',
      travelDateStart: json['Travel_DateStart'] ?? '',
      travelDateEnd: json['Travel_DateEnd'] ?? '',
      continentName: json['Continent_Name'] ?? '',
      country: json['Country'] ?? '',
    );
  }
}