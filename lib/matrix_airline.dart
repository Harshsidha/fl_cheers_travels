import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AirlineFareCard extends StatelessWidget {
  const AirlineFareCard({super.key});

  @override
  Widget build(BuildContext context) {
    final airlines = [
      {
        "name": "SriLankan Airlines",
        "image": "assets/images/ul.png",
        "nonStop": "--",
        "oneStop": "£ 716.01"
      },
      {
        "name": "Emirates Airways",
        "image": "assets/images/airlineLogo6.png",
        "nonStop": "--",
        "oneStop": "£ 724.11"
      },
      {
        "name": "Qantas Airlines",
        "image": "assets/images/qf.png",
        "nonStop": "--",
        "oneStop": "£ 771.41"
      },
      {
        "name": "Cathay Pacific",
        "image": "assets/images/cx.png",
        "nonStop": "--",
        "oneStop": "£ 775.41"
      },
      {
        "name": "Qantas Airways",
        "image": "assets/images/qf.png",
        "nonStop": "--",
        "oneStop": "£ 819.61"
      },
      {
        "name": "Emirates Airways",
        "image": "assets/images/airlineLogo6.png",
        "nonStop": "--",
        "oneStop": "£ 724.11"
      },
      {
        "name": "Qantas Airlines",
        "image": "assets/images/qf.png",
        "nonStop": "--",
        "oneStop": "£ 771.41"
      },
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Section: Alternative Dates
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xffdfecff),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Icon(Icons.calendar_month, size: 32, color: Colors.blue),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Alternative Dates",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,color: Color(0xff1e2020)),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Save £293.10 | £455.01",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Color(0xff271b19)),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Here are the cheapest Deals\nfor 6-day trips",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: Color(0xff706a64)),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "View Alternative Dates",
                    style: TextStyle(
                      color: Color(0xff0c44ac),
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Right Section: Carousel + Text
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 12, bottom: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    right: BorderSide(color: Colors.grey.shade300),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 16, top: 4),
                      child: const Text(
                        "Best Fare by Airlines Book Today",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Container(
                           width: 140,
                          padding: EdgeInsets.only(top: 18, bottom: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0XFFd8d8d8), width: 0.5),
                          ),
                           child: Column(
                             children: [
                               Text(
                                 "Show All Fares",
                                 style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                               ),
                               const SizedBox(height: 4),
                               const Divider(color: Color(0xFFd8d8d8), thickness: 0.5),
                               const SizedBox(height: 6),
                               Text(
                                 "Non Stop:",
                                 style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                               ),
                               const SizedBox(height: 6),
                               const Divider(color: Color(0xFFd8d8d8), thickness: 0.5),
                               const SizedBox(height: 6),
                               Text(
                                 "1+ Stop: ",
                                 style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                               ),
                             ],
                           ),
                        ),
                        Expanded(
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 146,
                              autoPlay: false,
                              enableInfiniteScroll: true,
                              viewportFraction: 1 / 6,
                              disableCenter: true,
                              padEnds: false,
                            ),
                            items: airlines.map((airline) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0XFFd8d8d8), width: 0.5),
                                    ),
                                    padding: const EdgeInsets.only(top: 10,),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 25,
                                          child: Image.asset(
                                            airline['image']!,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        const Divider(color: Color(0xFFd8d8d8), thickness: 0.5),
                                        const SizedBox(height: 6),
                                        Text(
                                          "${airline['nonStop']}",
                                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 6),
                                        const Divider(color: Color(0xFFd8d8d8), thickness: 0.5),
                                        const SizedBox(height: 6),
                                        Text(
                                          "${airline['oneStop']}",
                                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      "Fares for our carriers are round trip, incl. all taxes and all fees. Airfares include applied Booking Bonus. Additional baggage.",
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Handle your hyperlink logic here
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "View All Airlines",
                        style: TextStyle(
                          color: Color(0xff0c44ac),
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
