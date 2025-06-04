import 'package:flutter/material.dart';

class LuxuriousTreatmentSection extends StatelessWidget {
  const LuxuriousTreatmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Container(
      width: isDesktop ? 1280 : double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: isDesktop ? 40 : isTablet ? 24 : 16,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Luxurious Treatment in Air On',
            style: TextStyle(
              fontSize: isDesktop ? 20 : 18,
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
            style: TextStyle(
              fontSize: isDesktop ? 16 : 14,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 24),
          if (isDesktop || isTablet)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FlightClassCard(
                    imagePath: 'assets/images/busineshImage.jpg',
                    title: 'BUSINESS CLASS',
                    phone: '08 70952590',
                    height: isDesktop ? 500 : 400,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      FlightClassCard(
                        imagePath: 'assets/images/firstImgge.jpg',
                        title: 'FIRST CLASS',
                        phone: '08 70952590',
                        height: isDesktop ? 240 : 190,
                      ),
                      const SizedBox(height: 16),
                      FlightClassCard(
                        imagePath: 'assets/images/preeconmy.jpg',
                        title: 'PREMIUM ECONOMY',
                        phone: '08 70952590',
                        height: isDesktop ? 245 : 195,
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                FlightClassCard(
                  imagePath: 'assets/images/busineshImage.jpg',
                  title: 'BUSINESS CLASS',
                  phone: '08 70952590',
                  height: 300,
                ),
                const SizedBox(height: 16),
                FlightClassCard(
                  imagePath: 'assets/images/firstImgge.jpg',
                  title: 'FIRST CLASS',
                  phone: '08 70952590',
                  height: 200,
                ),
                const SizedBox(height: 16),
                FlightClassCard(
                  imagePath: 'assets/images/preeconmy.jpg',
                  title: 'PREMIUM ECONOMY',
                  phone: '08 70952590',
                  height: 200,
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
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width >= 600 ? 18 : 16,
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
                    Flexible(
                      child: Text(
                        'Phone Only Special Offer: $phone',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width >= 600 ? 14 : 12,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
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