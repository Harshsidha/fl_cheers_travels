import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  bool _showMobileMenu = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8 : 16,
        vertical: isMobile ? 4 : 6,
      ),
      color: Colors.white,
      child: isMobile
          ? buildMobileLayout(context)
          : isTablet
          ? buildTabletLayout(context)
          : buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    return Row(
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
                navItem("Home", isActive: true, onTap: () {
                  Navigator.pushNamed(context, '/home');
                }),
                navItem("About Us", onTap: () {
                  Navigator.pushNamed(context, '/about');
                }),
                navItem("Contact Us", onTap: () {
                  Navigator.pushNamed(context, '/contact');
                }),
                navItem("Secure Today's Price", onTap: () {
                  Navigator.pushNamed(context, '/secure-price');
                }),
                navItem("My Account", hasDropdown: true, onTap: () {
                  Navigator.pushNamed(context, '/account');
                }),
              ],
            ),

            // Right: Phone & Time
            buildPhoneInfo(),
          ],
        ),
      ],
    );
  }

  Widget buildTabletLayout(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/cheers-logo.png',
              width: 200,
            ),
            buildPhoneInfo(),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              navItem("Home", isActive: true, onTap: () {
                Navigator.pushNamed(context, '/home');
              }),
              navItem("About Us", onTap: () {
                Navigator.pushNamed(context, '/about');
              }),
              navItem("Contact Us", onTap: () {
                Navigator.pushNamed(context, '/contact');
              }),
              navItem("Secure Today's Price", onTap: () {
                Navigator.pushNamed(context, '/secure-price');
              }),
              navItem("My Account", hasDropdown: true, onTap: () {
                Navigator.pushNamed(context, '/account');
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/cheers-logo.png',
              width: 150,
            ),
            Row(
              children: [
                // Phone icon button
                IconButton(
                  icon: const Icon(Icons.phone, size: 30,),
                  color: const Color(0xFF003D99),
                  onPressed: () => launchUrl(Uri.parse("tel:0870952590")),
                ),
                // Menu toggle button
                IconButton(
                  icon: Icon(_showMobileMenu ? Icons.close : Icons.menu, size: 40,),
                  onPressed: () {
                    setState(() {
                      _showMobileMenu = !_showMobileMenu;
                    });
                  },
                ),
              ],
            ),
          ],
        ),

        // Toggleable mobile menu
        if (_showMobileMenu) ...[
          const SizedBox(height: 10),
          Column(
            children: [
              mobileNavItem("Home", isActive: true, onTap: () {
                Navigator.pushNamed(context, '/home');
                setState(() => _showMobileMenu = false);
              }),
              mobileNavItem("About Us", onTap: () {
                Navigator.pushNamed(context, '/about');
                setState(() => _showMobileMenu = false);
              }),
              mobileNavItem("Contact Us", onTap: () {
                Navigator.pushNamed(context, '/contact');
                setState(() => _showMobileMenu = false);
              }),
              mobileNavItem("Secure Today's Price", onTap: () {
                Navigator.pushNamed(context, '/secure-price');
                setState(() => _showMobileMenu = false);
              }),
              mobileNavItem("My Account", hasDropdown: true, onTap: () {
                Navigator.pushNamed(context, '/account');
                setState(() => _showMobileMenu = false);
              }),
            ],
          ),
        ],
      ],
    );
  }

  Widget mobileNavItem(
      String title, {
        bool isActive = false,
        bool hasDropdown = false,
        VoidCallback? onTap,
      }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isActive ? const Color(0XFF0c44ac) : Colors.black,
              ),
            ),
            if (hasDropdown) const Icon(Icons.arrow_drop_down, size: 24),
          ],
        ),
      ),
    );
  }

  Widget buildPhoneInfo() {
    return Row(
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
    );
  }

  Widget navItem(
      String title, {
        bool isActive = false,
        bool hasDropdown = false,
        VoidCallback? onTap,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isActive ? const Color(0XFF0c44ac) : Colors.black,
              ),
            ),
            if (hasDropdown) const Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ),
    );
  }
}