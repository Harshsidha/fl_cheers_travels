import 'package:flutter/material.dart';

class UsbSection extends StatelessWidget {
  const UsbSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F8FD),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 0),
     child: Center(
       child: SizedBox(
         width: 1210,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
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
           ],
         ),
       ),
     ),
    );
  }

  Widget _buildUsbCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    String? phone,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.19,
      padding: const EdgeInsets.only(top: 15, left: 15,right: 15,),
      height: 85,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.grey.shade700),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 12, color: Colors.grey.shade600, height: 1.3),
                ),
                if (phone != null)
                  Text(
                    phone,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      height: 1.3,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
