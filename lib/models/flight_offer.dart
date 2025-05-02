class FlightDeal {
  final String destination;
  final String departureCity;
  final double price;
  final String travelDates;
  final String airline;
  final String dealId;

  FlightDeal({
    required this.destination,
    required this.departureCity,
    required this.price,
    required this.travelDates,
    required this.airline,
    required this.dealId,
  });

  factory FlightDeal.fromJson(Map<String, dynamic> json) {
    return FlightDeal(
      destination: json['destination'] ?? '',
      departureCity: json['departureCity'] ?? json['departureAirport'] ?? '',
      price: double.tryParse(json['price']?.toString() ?? '0') ?? 0.0,
      travelDates: json['travelDates'] ?? json['validDates'] ?? 'Available dates',
      airline: json['airline'] ?? 'Multiple Airlines',
      dealId: json['dealId']?.toString() ?? json['id']?.toString() ?? '',
    );
  }
}