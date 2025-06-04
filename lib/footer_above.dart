import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        // Define responsive breakpoints
        bool isMobile = screenWidth < 600;
        bool isTablet = screenWidth >= 600 && screenWidth < 1000;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 40,
            vertical: isMobile ? 30 : 40,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/footerabove_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: isMobile
              ? _buildMobileLayout()
              : isTablet
              ? _buildTabletLayout()
              : _buildDesktopLayout(),
        );
      },
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildDestinationCards(mobile: true),
        const SizedBox(height: 30),
        _buildHelpContent(mobile: true),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Column(
      children: [
        _buildDestinationCards(),
        const SizedBox(height: 40),
        _buildHelpContent(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildDestinationCards()),
        const SizedBox(width: 40),
        Expanded(flex: 3, child: _buildHelpContent()),
      ],
    );
  }

  Widget _buildDestinationCards({bool mobile = false}) {
    return SizedBox(
      height: mobile ? 230 : 280,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: mobile ? 10 : 18),
        children: const [
          SizedBox(width: 8),
          DestinationCard(
            image: 'assets/images/thailand.jpg',
            label: '',
          ),
          SizedBox(width: 10),
          DestinationCard(
            image: 'assets/images/australia.jpg',
            label: '',
          ),
          SizedBox(width: 10),
          DestinationCard(
            image: 'assets/images/uae.jpg',
            label: '',
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildHelpContent({bool mobile = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Didn't find what you are looking for –\nWe are here to help!",
          style: TextStyle(
            fontSize: mobile ? 22 : 26,
            color: Colors.white,
            fontWeight: FontWeight.w300,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          mobile
              ? "Cheers Travel Partners is an Australian based company. Cheers Travel stands as one of the largest retail & online travel agencies. Accessing budget-friendly flights is easy: you can call our contact centre at "
              : "Cheers Travel Partners is an Australian based company. Cheers Travel stands as one of\n"
              "the largest retail & online travel agencies. Accessing budget-friendly flights is easy:\n"
              "you can call our contact centre at ",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            height: 1.8,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: '08 70992292',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: mobile
                    ? ', or simply email us at '
                    : ', or simply email us at ',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 2
                ),
              ),
              TextSpan(
                text: 'care@cheerstravel.com.au',
                style: const TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'care@cheerstravel.com.au',
                    );
                    if (await canLaunchUrl(emailLaunchUri)) {
                      await launchUrl(emailLaunchUri);
                    }
                  },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildActionButton(
              icon: Icons.phone,
              label: "Call 08 70992292",
              onPressed: () async {
                final Uri telLaunchUri = Uri(scheme: 'tel', path: '0870992292');
                if (await canLaunchUrl(telLaunchUri)) {
                  await launchUrl(telLaunchUri);
                }
              },
              mobile: mobile,
            ),
            _buildActionButton(
              icon: Icons.email,
              label: "Make an Enquiry",
              onPressed: () {
                // Add enquiry functionality
              },
              mobile: mobile,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    bool mobile = false,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(
          vertical: mobile ? 12 : 15,
          horizontal: mobile ? 12 : 20,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      icon: Icon(icon, size: mobile ? 20 : 25),
      label: Text(
        label,
        style: TextStyle(fontSize: mobile ? 16 : 19),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String image;
  final String label;

  const DestinationCard({required this.image, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            image,
            height: 190,
            width: 140,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}