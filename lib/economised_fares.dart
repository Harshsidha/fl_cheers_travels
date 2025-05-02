import 'package:flutter/material.dart';

class LuxuriousTreatmentSection extends StatelessWidget {
  const LuxuriousTreatmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Luxurious Treatment in Air On',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: const TextSpan(
              text: 'Economised ',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'Fares',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Avail low cost flight tickets and super amazing deals on the First Class, Business Class and the Premium Economy seats with premium airlines. We offer great deals on the last minute flight tickets and negotiate on corporate air fares as well. We add comfort, luxury and unlimited relaxation in flying on affordable costs',
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FlightClassCard(
                  imagePath: 'assets/images/busineshImage.jpg',
                  title: 'BUSINESS CLASS',
                  phone: '08 70952590',
                  height: 500,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: const [
                    FlightClassCard(
                      imagePath: 'assets/images/firstImgge.jpg',
                      title: 'FIRST CLASS',
                      phone: '08 70952590',
                      height: 240,
                    ),
                    SizedBox(height: 16),
                    FlightClassCard(
                      imagePath: 'assets/images/preeconmy.jpg',
                      title: 'PREMIUM ECONOMY',
                      phone: '08 70952590',
                      height: 245,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FlightClassCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String phone;
  final double height;

  const FlightClassCard({
    required this.imagePath,
    required this.title,
    required this.phone,
    this.height = 200,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: height,
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 16, color: Colors.red),
                    const SizedBox(width: 6),
                    Text(
                      'Phone Only Special Offer: $phone',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
