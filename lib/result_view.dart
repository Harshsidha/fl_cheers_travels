import 'package:cheers_travel_website/short_filter.dart';
import 'package:flutter/material.dart';
import 'flightI_nfo.dart';
import 'flight_result_view.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          children: [
            FlightInfoCard(),
            SizedBox(height: 10,),
            FlightFilterBar(),
            SizedBox(height: 10,),
            FlightCard(),
          ],
      ),
    );
  }
}
