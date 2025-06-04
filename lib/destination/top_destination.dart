import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dotted_border/dotted_border.dart';
import '../models/offer_page.dart';
import '../footer.dart';
import '../footer_above.dart';
import '../header.dart';
import '../search_widget.dart';
import '../usb_section.dart';

class FlightDestinationPage extends StatefulWidget {
  final String destination;

  const FlightDestinationPage({Key? key, required this.destination}) : super(key: key);

  @override
  State<FlightDestinationPage> createState() => _FlightDestinationPageState();
}

class _FlightDestinationPageState extends State<FlightDestinationPage> {
  List<DestinationFare> filteredFares = [];
  bool isLoading = true;
  bool hasError = false;
  String normalizedDestination = '';

  @override
  void initState() {
    super.initState();
    normalizedDestination = widget.destination.trim().toLowerCase();
    fetchDestinationFares();
  }

  Future<void> fetchDestinationFares() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      final url = Uri.parse("https://homepage.cheerstravel.com.au/Gethomepagedeal?compnayId=Cheers");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final allFares = (jsonData['destinationFares'] as List)
            .map((e) => DestinationFare.fromJson(e))
            .toList();

        setState(() {
          filteredFares = allFares.where((fare) {
            final String fareDestination = fare.destToName.trim().toLowerCase();
            final String fareCode = fare.to.trim().toLowerCase();
            bool directMatch = fareDestination == normalizedDestination || fareCode == normalizedDestination;
            bool partialMatch = fareDestination.contains(normalizedDestination) ||
                normalizedDestination.contains(fareDestination);
            return directMatch || partialMatch;
          }).toList();
          isLoading = false;
          hasError = false;
        });
      } else {
        setState(() {
          isLoading = false;
          hasError = true;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  Widget dashedBorderContainer({required Widget child}) {
    return DottedBorder(
      color: const Color(0xffd3d3d3),
      strokeWidth: 1,
      dashPattern: [3, 2],
      borderType: BorderType.RRect,
      radius: const Radius.circular(0),
      padding: const EdgeInsets.all(0),
      child: child,
    );
  }

  Widget buildFareCard(DestinationFare fare) {
    return dashedBorderContainer(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dep: ${fare.travelDateStart}",
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(fare.from,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, height: 1)),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                child: const Divider(color: Colors.grey, thickness: 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.flight, size: 20, color: Colors.grey),
                          const SizedBox(width: 4),
                          Transform.rotate(
                            angle: 0.8,
                            child: const Icon(Icons.flight, size: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                child: const Divider(color: Colors.grey, thickness: 1),
                              ),
                            ),
                            const CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Ret: ${fare.travelDateEnd}",
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(fare.to,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, height: 1)),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      fare.airlineName,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$${fare.grandTotal.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 900 ? 2 : screenWidth > 600 ? 2 : 1;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              HeaderSection(),
              SearchWidget(),
              UsbSection(),
              SizedBox(
                width: 1200,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Best Flights to ${widget.destination.toUpperCase()}",
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Our airfares include all our service fees, taxes and fees. Bonuses apply to certain airfares. Read our baggage policy for details on baggage charges.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      if (isLoading)
                        const Center(child: CircularProgressIndicator())
                      else if (hasError)
                        const Center(
                          child: Text(
                            "Error loading flight data. Please try again later.",
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        )
                      else if (filteredFares.isEmpty)
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "No flights found to ${widget.destination.toUpperCase()}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    fetchDestinationFares();
                                  },
                                  child: const Text("Refresh"),
                                ),
                              ],
                            ),
                          )
                        else
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filteredFares.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 5.5,
                            ),
                            itemBuilder: (context, index) {
                              return buildFareCard(filteredFares[index]);
                            },
                          ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              HelpSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
