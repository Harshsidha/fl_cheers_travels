import 'package:flutter/material.dart';

class FlightInfoCard extends StatelessWidget {
  const FlightInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'date': 'Thu, 27 Feb', 'price': 'AU\$1,202'},
      {'date': 'Fri, 28 Feb', 'price': 'AU\$1,349'},
      {'date': 'Sat, 1 Mar', 'price': 'AU\$1,017'},
      {'date': 'Sun, 2 Mar', 'price': 'AU\$1,200', 'selected': true},
      {'date': 'Mon, 3 Mar', 'price': 'AU\$956', 'highlight': true},
      {'date': 'Tue, 4 Mar', 'price': 'AU\$980'},
      {'date': 'Wed, 5 Mar', 'price': 'AU\$996'},
      {'date': 'Tue, 4 Mar', 'price': 'AU\$980'},
    ];
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF0A4ABF),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 3,),
                    child: Text(
                      '2. Returning to Sydney',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15,bottom: 3,),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Text(
                            '*Last updated: 12:48:56 ',
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                          Icon(Icons.info_outline, color: Colors.white, size: 14,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Details card
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0FB),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    // Depart Button
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1565C0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Depart',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Date and Time Info
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          const Text('Thu, Feb 20'),
                          const SizedBox(height: 2),
                          SizedBox(width: 20),
                          Row(
                            children: const [
                              Text('20:30 – 03:50'),
                              SizedBox(width: 5),
                              Text(
                                '+1d',
                                style: TextStyle(color: Colors.orange, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          const Text('Sydney – New Delhi'),
                          SizedBox(width: 20),
                          const Row(
                            children: [
                              Icon(Icons.access_time, size: 16),
                              SizedBox(width: 5),
                              Text('12h 50m'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Duration
                    const SizedBox(width: 10),
                    // Change Flight
                    Text(
                      'Change Flight',
                      style: TextStyle(
                        color: Color(0xff0c44ac), fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Last updated time
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              children: items.map((item) {
                final isSelected = item['selected'] == true;
                final isHighlight = item['highlight'] == true;

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFE3F2FD) : Colors.white, // light blue when selected
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.grey.shade300,
                      width: 1,
                    ),
                    boxShadow: isSelected
                        ? [const BoxShadow(color: Colors.black12, blurRadius: 4)]
                        : [],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item['date'] as String,
                        style: const TextStyle(
                            fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        item['price'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          color: isHighlight ? Colors.green : Colors.black,
                          fontWeight: isHighlight ? FontWeight.bold : FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );

  }
}
