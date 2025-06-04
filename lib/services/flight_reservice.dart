import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/flight_models.dart';

class FlightApiService {
  static const String baseUrl = 'https://newflightapi.cheerstravel.com.au/api/searchfare'; // Replace with your actual API URL

  // Fetch flights from API
  static Future<List<Flight>> getFlights({
    required String from,
    required String to,
    required String departureDate,
    String? returnDate,
  }) async {
    try {
      // Construct your API URL with parameters
      final url = Uri.parse('$baseUrl/flights?from=$from&to=$to&departure=$departureDate${returnDate != null ? '&return=$returnDate' : ''}');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          // Add any required API headers like authorization
          // 'Authorization': 'Bearer YOUR_API_KEY',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> flightsJson = data['flights'] ?? data['data'] ?? []; // Adjust based on your API response structure

        return flightsJson.map((json) => Flight.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load flights: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching flights: $e');
    }
  }
}