import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class HeaderResult extends StatelessWidget {
  const HeaderResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left: Logo
          Row(
            children: [
              Image.asset(
                'assets/images/cheers-logo.png',
                width: 270,
              ),
            ],
          ),

          // Center: Navigation
          Row(
            children: [
              Row(
                children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                _buildInfoBlock("Sat 15 Mar", "SYD ➜ CHC"),
                Container(width: 1,height: 90,color: Color(0xFFd8d8d8), margin: EdgeInsets.only(left: 20, right: 20),),
                _buildInfoBlock("Sun 6 Apr", "CHC ➜ SYD"),
                  Container(width: 1,height: 90,color: Color(0xFFd8d8d8), margin: EdgeInsets.only(left: 20, right: 20),),
                _buildInfoBlock("Passengers", "1 ADULT"),
                  Container(width: 1,height: 90,color: Color(0xFFd8d8d8), margin: EdgeInsets.only(left: 20, right: 20),),
                _buildEditSearchButton(),
                  Container(width: 1,height: 90,color: Color(0xFFd8d8d8), margin: EdgeInsets.only(left: 20, right: 20),),
                _buildAccountDropdown(),
                ],
                ),
                ],
              ),

              // Right: Phone & Time
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Color(0xFF003D99),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: const Icon(Icons.phone, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () => launchUrl(Uri.parse("tel:0489994765")),
                        child: const Text(
                          "04 89994765",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF666666),
                            height: 0.9,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => launchUrl(Uri.parse("tel:0870952590")),
                        child: const Text(
                          "08 70952590",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF666666),
                            height: 1,
                          ),
                        ),
                      ),
                      const Text(
                        "08:30 AM - 00:30 AM AEST",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                ],
              )

            ],
          )
        ],
      ),
    );
  }
  Widget _buildInfoBlock(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
        Text(
          subtitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
  Widget _buildEditSearchButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.edit, size: 16),
      label: const Text("Edit search"),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFe6ecf7),
        foregroundColor: const Color(0xff0c44ac),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4), // <-- Border radius here
        ),
      ),
    );
  }

  Widget _buildAccountDropdown() {
    return Container(
      padding: const EdgeInsets.only(right: 4, top: 3, bottom: 5, left: 12),
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFe5eef4),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: const [
          Text(
            "My Account",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
  }
