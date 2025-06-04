// FILE: lib/pages/destinations/top_destinations.dart
import 'package:flutter/material.dart';
// Import the correct page
import '../destination/top_destination.dart';

class TopFlightOffers extends StatelessWidget {
  final List<Map<String, String>> offers = [
    {"title": "Brisbane", "image": "assets/images/offersImage1.png"},
    {"title": "Ballina", "image": "assets/images/offersImage2.jpg"},
    {"title": "Gold Coast", "image": "assets/images/offersImage3.jpg"}, // Fixed typo
    {"title": "Adelaide", "image": "assets/images/offersImage4.jpg"}, // Fixed typo
    {"title": "Sydney", "image": "assets/images/offersImage5.jpg"},
    {"title": "Tokyo", "image": "assets/images/offersImage6.jpg"},
  ];

  TopFlightOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Top Flight Offers',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Cheers Travel stands as one of the largest retail and online travel agencies. Accessing budget-friendly flights is easy; you can visit us at our office in Murray Bridge, call our contact centre, or simply explore our website',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff434343),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 30),
          GridView.builder(
            shrinkWrap: true,
            itemCount: offers.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              final offer = offers[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      offer['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          offer['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 5),
                        InkWell(
                          onTap: () {
                            // Navigate to flight details page with exact destination name
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FlightDestinationPage(
                                  destination: offer['title']!, // Pass the destination with correct spelling
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'View Flights',
                              style: TextStyle(
                                color: Color(0xff0c44ac),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}