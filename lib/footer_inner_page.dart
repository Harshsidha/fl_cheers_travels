import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterInnerPage extends StatelessWidget {
  const FooterInnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      child: Center(
        child: SizedBox(
          width: 1200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Columns
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© Copyright 2025, Cheers Travel All Rights Reserved.',
                    style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center,
                  ),
                  _buildColumn('Support', {
                    'Privacy Policy': '/',
                    'Terms and Conditions': '/',
                    'Customer Support': '/',
                  }),
                ],
              ),

              // Company Info

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColumn(String title, Map<String, String> items) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 12),
          ...items.entries.map(
                (entry) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: () => _launchURL(entry.value),
                child: Text(
                  entry.key,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
