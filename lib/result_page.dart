import 'package:cheers_travel_website/result_filter.dart';
import 'package:cheers_travel_website/result_view.dart';
import 'package:flutter/material.dart';
import 'footer_inner_page.dart';
import 'header_result.dart';
import 'matrix_airline.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff0f2f5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const HeaderResult(),
                const SizedBox(height: 20),
                SizedBox(
                  width: 1200,
                  child: Column(
                    children: [
                      const AirlineFareCard(),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 300,
                            height: 800,
                            child: FlightFilterPanel(),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: ResultView(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const FooterInnerPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

