import 'package:flutter/material.dart';

class FlightFilterBar extends StatelessWidget {
  final List<Map<String, String>> filters = [
    {'title': 'Direct First', 'price': 'AU\$ 2,546'},
    {'title': 'Recommended', 'price': 'AU\$ 2,546'},
    {'title': 'Cheapest', 'price': 'AU\$ 2,546'},
    {'title': 'Alternate date', 'price': 'AU\$ 2,546'},
    {'title': 'Near By Airports', 'price': 'AU\$ 2,546'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => VerticalDivider(
          width: 1,
          color: Colors.grey.shade300,
        ),
        itemBuilder: (context, index) {
          final item = filters[index];
          final isSelected = index == 0; // Highlight first one
          return Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 4, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      item['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    if (item['title'] == 'Recommended')
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Icon(Icons.info_outline, size: 14, color: Colors.grey),
                      ),
                  ],
                ),
                const SizedBox(height: 0),
                Row(
                  children: [
                    Text(
                      item['price']!,
                      style: TextStyle(
                        color: isSelected ? Colors.black : Color(0xff8592a9),
                        decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      ),
                    ),
                    if (item['title'] == 'Alternate date' || item['title'] == 'Near By Airports')
                      Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xff8592a9)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}