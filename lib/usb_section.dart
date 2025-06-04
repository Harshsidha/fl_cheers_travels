import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Add this package to your pubspec.yaml

class UsbSection extends StatelessWidget {
  const UsbSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F8FD),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1200) {
            // Desktop layout
            return Center(
              child: SizedBox(
                width: 1210,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildAllCards(context),
                ),
              ),
            );
          } else if (constraints.maxWidth >= 800) {
            // Tablet layout - 2 cards per row
            return Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: _buildAllCards(context),
              ),
            );
          } else {
            // Mobile layout - carousel slider
            return _buildMobileCarousel(context);
          }
        },
      ),
    );
  }

  Widget _buildMobileCarousel(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 90,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: _buildAllCards(context).map((card) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: card,
            );
          },
        );
      }).toList(),
    );
  }

  List<Widget> _buildAllCards(BuildContext context) {
    return [
      _buildUsbCard(
        context: context,
        icon: Icons.verified_user_outlined,
        title: "Buy with Confidence",
        subtitle: "Fly with Confidence",
      ),
      _buildUsbCard(
        context: context,
        icon: Icons.check_box_outlined,
        title: "Easy Booking",
        subtitle: "Search, select and save – the fastest way to book your trip",
      ),
      _buildUsbCard(
        context: context,
        icon: Icons.headset_mic_outlined,
        title: "24/7 Customer Care",
        subtitle: "Get special deals by calling",
        phone: "08 70952590",
      ),
      _buildUsbCard(
        context: context,
        icon: Icons.security_outlined,
        title: "100% Secure and Safe",
        subtitle: "We provide 100% Safe Secure Booking",
      ),
    ];
  }

  Widget _buildUsbCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    String? phone,
  }) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: isMobile
          ? double.infinity
          : MediaQuery.of(context).size.width < 1200
          ? MediaQuery.of(context).size.width * 0.45
          : MediaQuery.of(context).size.width * 0.19,
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      height: isMobile ? null : 85,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: isMobile ? 30 : 40, color: Colors.grey.shade700),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: isMobile ? 13 : 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: isMobile ? 11 : 12,
                      color: Colors.grey.shade600,
                      height: 1.3),
                ),
                if (phone != null)
                  Padding(
                    padding: EdgeInsets.only(top: isMobile ? 4 : 0),
                    child: Text(
                      phone,
                      style: TextStyle(
                        fontSize: isMobile ? 13 : 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        height: 1.3,
                      ),
                    ),
                  ),
                if (isMobile) const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}