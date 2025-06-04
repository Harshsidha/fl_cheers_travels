class Flight {
  final String airline;
  final String airlineCode;
  final String departureTime;
  final String arrivalTime;
  final String departureAirport;
  final String arrivalAirport;
  final String duration;
  final String price;
  final String currency;
  final bool isDirect;
  final List<String> amenities;
  final String baggage;
  final bool isCheapest;
  final int seatsLeft;
  final String logoUrl;

  Flight({
    required this.airline,
    required this.airlineCode,
    required this.departureTime,
    required this.arrivalTime,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.duration,
    required this.price,
    required this.currency,
    required this.isDirect,
    required this.amenities,
    required this.baggage,
    required this.isCheapest,
    required this.seatsLeft,
    required this.logoUrl,
  });

  // Factory constructor to create Flight from JSON
  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      airline: json['airline'] ?? '',
      airlineCode: json['airline_code'] ?? '',
      departureTime: json['departure_time'] ?? '',
      arrivalTime: json['arrival_time'] ?? '',
      departureAirport: json['departure_airport'] ?? '',
      arrivalAirport: json['arrival_airport'] ?? '',
      duration: json['duration'] ?? '',
      price: json['price']?.toString() ?? '0',
      currency: json['currency'] ?? 'AUD',
      isDirect: json['is_direct'] ?? true,
      amenities: List<String>.from(json['amenities'] ?? []),
      baggage: json['baggage'] ?? '',
      isCheapest: json['is_cheapest'] ?? false,
      seatsLeft: json['seats_left'] ?? 0,
      logoUrl: json['logo_url'] ?? '',
    );
  }
}