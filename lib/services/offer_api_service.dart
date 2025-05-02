import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/flight_offer.dart';

class FlightDealService {
  static Future<List<FlightDeal>> fetchDeals() async {
    final url = Uri.parse('http://test.cheerstravel.com.au/Gethomepagedeal?compnayId=Cheers');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List deals = decoded['destinationFares'];
      return deals.map((e) => FlightDeal.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load flight deals');
    }
  }
}
