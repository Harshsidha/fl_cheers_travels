import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;
        return Container(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/footerabove_bg.jpg"),
              fit: BoxFit.cover, // or BoxFit.contain, BoxFit.fill, etc.
            ),
          ),
          child: isMobile
              ? Column(
            children: [
              _buildLeftSide(),
              const SizedBox(height: 40),
              _buildRightSide(),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: _buildLeftSide()),
              const SizedBox(width: 40),
              Expanded(flex: 3, child: _buildRightSide()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLeftSide() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 90),
        Container(
          width: 450,
          height: 280,
          padding: EdgeInsets.only(top: 18),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              DestinationCard(
                  image: 'assets/images/thailand.jpg', label: '',),
              SizedBox(width: 10),
              DestinationCard(
                  image: 'assets/images/australia.jpg', label: ''),
              SizedBox(width: 10),
              DestinationCard(
                  image: 'assets/images/uae.jpg',
                  label: ''),
            ],
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildRightSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Didn't find what you are looking for –\nWe are here to help!",
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.w300,
            height: 1.3
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "Cheers Travel Partners is an Australian based company. Cheers Travel stands as one of\n"
              "the largest retail & online travel agencies. Accessing budget-friendly flights is easy:\n"
              "you can call our contact centre at ",
          style: TextStyle(color: Colors.white, fontSize: 14, height: 1.8),
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
              const TextSpan(
                text: ', or simply email us at ',
                style: TextStyle(color: Colors.white, fontSize: 14, height: 2),
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
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                final Uri telLaunchUri = Uri(scheme: 'tel', path: '0870992292');
                if (await canLaunchUrl(telLaunchUri)) {
                  await launchUrl(telLaunchUri);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              icon: const Icon(Icons.phone, size: 25,),
              label: const Text("Call 08 70992292", style: TextStyle(fontSize: 19,),),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Add enquiry functionality or route here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              icon: const Icon(Icons.email, size: 25,),
              label: const Text("Make an Enquiry", style: TextStyle(fontSize: 19,)),
            ),
          ],
        )
      ],
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
            height: 214,
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
