import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1000;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/footer_bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 20 : 40,
        horizontal: isMobile ? 10 : 20,
      ),
      child: Center(
        child: SizedBox(
          width: isTablet ? double.infinity : 1200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Columns
              isMobile
                  ? _buildMobileColumns()
                  : isTablet
                  ? _buildTabletColumns()
                  : _buildDesktopColumns(),

              const SizedBox(height: 40),

              // Payment Icons
              Center(
                child: Container(
                  width: isTablet ? double.infinity : 1200,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/payment.png',
                      height: isMobile ? 30 : 40,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Partner Logos
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/partnerlogo.png',
                      height: isMobile ? 40 : 56,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Company Info
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 0),
                child: const Center(
                  child: Text(
                    'Cheers Travel Partners is an Australian based company. PO Box 5026 Murray Bridge South 5253 Australia.',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  '© Copyright 2025, Cheers Travel All Rights Reserved.',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopColumns() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildColumn('Who We are', {
          'Home': '/',
          'About Us': '/',
          'Contact Us': '/',
          'Faq': '/',
        }),
        _buildColumn('Destinations', {
          'Brisbane': '/',
          'Ballina': '/',
          'Gold Coast': '/',
          'Melbourne': '/',
          'Sydney': '/',
        }),
        _buildColumn('Support', {
          'Privacy Policy': '/',
          'Terms and Conditions': '/',
          'Website Terms of Use': '/',
          'Customer Support': '/',
        }),
        _buildLoginSection(),
      ],
    );
  }

  Widget _buildTabletColumns() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildColumn('Who We are', {
              'Home': '/',
              'About Us': '/',
              'Contact Us': '/',
              'Faq': '/',
            })),
            Expanded(child: _buildColumn('Destinations', {
              'Brisbane': '/',
              'Ballina': '/',
              'Gold Coast': '/',
              'Melbourne': '/',
              'Sydney': '/',
            })),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildColumn('Support', {
              'Privacy Policy': '/',
              'Terms and Conditions': '/',
              'Website Terms of Use': '/',
              'Customer Support': '/',
            })),
            Expanded(child: _buildLoginSection()),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileColumns() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildColumn('Who We are', {
          'Home': '/',
          'About Us': '/',
          'Contact Us': '/',
          'Faq': '/',
        }),
        const SizedBox(height: 20),
        _buildColumn('Destinations', {
          'Brisbane': '/',
          'Ballina': '/',
          'Gold Coast': '/',
          'Melbourne': '/',
          'Sydney': '/',
        }),
        const SizedBox(height: 20),
        _buildColumn('Support', {
          'Privacy Policy': '/',
          'Terms and Conditions': '/',
          'Website Terms of Use': '/',
          'Customer Support': '/',
        }),
        const SizedBox(height: 20),
        _buildLoginSection(),
      ],
    );
  }

  Widget _buildColumn(String title, Map<String, String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...items.entries.map(
              (entry) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: InkWell(
              onTap: () => _launchURL(entry.value),
              child: Text(
                entry.key,
                style: const TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Log in',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () => _launchURL('/'),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white60),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.person_outline, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'My Bookings',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}