import 'package:flutter/material.dart';

class TravelGuidesSection extends StatelessWidget {
  const TravelGuidesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfffbfbfb),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          const Text(
            'Travel Guides',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'MAKE EVERY TRIP SPECIAL',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 30),

          // Airline logos
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assets/images/airlineLogo${index + 1}.png',
                    height: 40,
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 40),

          // Travel Guide Cards
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: const [
              TravelCard(
                imagePath: 'assets/images/travelGuide.webp',
                title: 'ATHENS',
              ),
              TravelCard(
                imagePath: 'assets/images/travelGuide1.webp',
                title: 'PARIS',
              ),
              TravelCard(
                imagePath: 'assets/images/travelGuide2.webp',
                title: 'MEXICO CITY',
              ),
              TravelCard(
                imagePath: 'assets/images/travelGuide3.webp',
                title: 'BRISBANE',
              ),
            ],
          ),

          const SizedBox(height: 30),

          // View More Button
          // View More Button
          TextButton(
            style: TextButton.styleFrom(
              side: const BorderSide(color: Color(0xff0c44ac)),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0)),
              ),
            ),
            onPressed: () {
              // Handle button tap
            },
            child: const Text(
              'View More',
              style: TextStyle(
                color: Color(0xff0c44ac),
                fontWeight: FontWeight.bold,
              ),
            ),
          )

        ],
      ),
    );
  }
}

class TravelCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const TravelCard({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 282,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 400,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(0, 1),
                    blurRadius: 6,
                    color: Colors.black87,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
