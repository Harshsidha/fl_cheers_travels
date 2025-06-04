import 'package:flutter/material.dart';
import 'package:cheers_travel_website/top_flight_offers.dart';
import 'package:cheers_travel_website/travel_guides.dart';
import 'package:cheers_travel_website/usb_section.dart';
import 'economised_fares.dart';
import 'header.dart';
import 'footer.dart';
import 'footer_above.dart';
import 'search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
     child: Column(
       children: [
         HeaderSection(),
         SearchWidget(),
         UsbSection(),
         TopFlightOffers(),
         TravelGuidesSection(),
         LuxuriousTreatmentSection(),
         HelpSection(),
         FooterSection(),
       ],
     ),
    );
  }
}


