import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/flight_suggestion.dart';

class FlightService {
  static Future<List<FlightSuggestion>> fetchSuggestions(String code) async {
    final url = Uri.parse('http://dbutility.cheerstravel.com.au/FlightAutoComplete/?code=$code&WebsiteID=1001');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => FlightSuggestion.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load suggestions');
    }
  }
}
