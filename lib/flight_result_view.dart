import 'package:flutter/material.dart';

class FlightCard extends StatelessWidget {
  const FlightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                // Left Section
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: const Text(
                              'Cheapest',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              color: Color(0xfffaebeb),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.luggage, size: 20, color: Color(0xff0c44ac)),
                                SizedBox(width: 4),
                                Text('Checked baggage 25 kg', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ai.png',
                            width: 70,
                          ),
                          const SizedBox(width: 15),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Air India', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.bolt, size: 18, color: Color(0xff0c44ac)),
                                  SizedBox(width: 6),
                                  Icon(Icons.restaurant, size: 15, color: Color(0xff0c44ac)),
                                  SizedBox(width: 9),
                                  Icon(Icons.tv, size: 15, color: Color(0xff0c44ac)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Center Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('00:55', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('DEL T3', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    children: [
                      const Text('12h 35m', style: TextStyle(fontSize: 14, color: Colors.black)),
                      const SizedBox(height: 4),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(thickness: 1.5, color: Colors.grey.shade300, indent: 10, endIndent: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                              Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text('Direct', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('19:00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('SYD T1', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Right Section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('AU\$ 2,546', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Return', style: TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4, width: 15,),
                    Container(
                      clipBehavior: Clip.none,
                      decoration: const BoxDecoration(), // Required for clipBehavior to take effect
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                              backgroundColor: const Color(0xff0c44ac),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Select', style: TextStyle(color: Colors.white, fontSize: 16)),
                                Icon(Icons.keyboard_arrow_down_outlined, size: 22, color: Colors.white),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 2,
                            top: -10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: const Text('<5 left', style: TextStyle(color: Colors.white, fontSize: 10)),
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                // Left Section
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: const Text(
                              'Cheapest',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              color: Color(0xfffaebeb),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.luggage, size: 20, color: Color(0xff0c44ac)),
                                SizedBox(width: 4),
                                Text('Checked baggage 25 kg', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ai.png',
                            width: 70,
                          ),
                          const SizedBox(width: 15),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Air India', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.bolt, size: 18, color: Color(0xff0c44ac)),
                                  SizedBox(width: 6),
                                  Icon(Icons.restaurant, size: 15, color: Color(0xff0c44ac)),
                                  SizedBox(width: 9),
                                  Icon(Icons.tv, size: 15, color: Color(0xff0c44ac)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Center Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('00:55', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('DEL T3', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    children: [
                      const Text('12h 35m', style: TextStyle(fontSize: 14, color: Colors.black)),
                      const SizedBox(height: 4),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(thickness: 1.5, color: Colors.grey.shade300, indent: 10, endIndent: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                              Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text('Direct', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('19:00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('SYD T1', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Right Section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('AU\$ 2,546', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Return', style: TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4, width: 15,),
                    Container(
                      clipBehavior: Clip.none,
                      decoration: const BoxDecoration(), // Required for clipBehavior to take effect
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                              backgroundColor: const Color(0xff0c44ac),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Select', style: TextStyle(color: Colors.white, fontSize: 16)),
                                Icon(Icons.keyboard_arrow_down_outlined, size: 22, color: Colors.white),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                // Left Section
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: const Text(
                              'Cheapest',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              color: Color(0xfffaebeb),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.luggage, size: 20, color: Color(0xff0c44ac)),
                                SizedBox(width: 4),
                                Text('Checked baggage 25 kg', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ai.png',
                            width: 70,
                          ),
                          const SizedBox(width: 15),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Air India', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.bolt, size: 18, color: Color(0xff0c44ac)),
                                  SizedBox(width: 6),
                                  Icon(Icons.restaurant, size: 15, color: Color(0xff0c44ac)),
                                  SizedBox(width: 9),
                                  Icon(Icons.tv, size: 15, color: Color(0xff0c44ac)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Center Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('00:55', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('DEL T3', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    children: [
                      const Text('12h 35m', style: TextStyle(fontSize: 14, color: Colors.black)),
                      const SizedBox(height: 4),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(thickness: 1.5, color: Colors.grey.shade300, indent: 10, endIndent: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                              Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text('Direct', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('19:00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('SYD T1', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Right Section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('AU\$ 2,546', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Return', style: TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4, width: 15,),
                    Container(
                      clipBehavior: Clip.none,
                      decoration: const BoxDecoration(), // Required for clipBehavior to take effect
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                              backgroundColor: const Color(0xff0c44ac),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Select', style: TextStyle(color: Colors.white, fontSize: 16)),
                                Icon(Icons.keyboard_arrow_down_outlined, size: 22, color: Colors.white),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 2,
                            top: -10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: const Text('<5 left', style: TextStyle(color: Colors.white, fontSize: 10)),
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                // Left Section
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: const Text(
                              'Cheapest',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              color: Color(0xfffaebeb),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.luggage, size: 20, color: Color(0xff0c44ac)),
                                SizedBox(width: 4),
                                Text('Checked baggage 25 kg', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ai.png',
                            width: 70,
                          ),
                          const SizedBox(width: 15),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Air India', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.bolt, size: 18, color: Color(0xff0c44ac)),
                                  SizedBox(width: 6),
                                  Icon(Icons.restaurant, size: 15, color: Color(0xff0c44ac)),
                                  SizedBox(width: 9),
                                  Icon(Icons.tv, size: 15, color: Color(0xff0c44ac)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Center Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('00:55', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('DEL T3', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    children: [
                      const Text('12h 35m', style: TextStyle(fontSize: 14, color: Colors.black)),
                      const SizedBox(height: 4),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(thickness: 1.5, color: Colors.grey.shade300, indent: 10, endIndent: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                              Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text('Direct', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('19:00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('SYD T1', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Right Section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('AU\$ 2,546', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Return', style: TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4, width: 15,),
                    Container(
                      clipBehavior: Clip.none,
                      decoration: const BoxDecoration(), // Required for clipBehavior to take effect
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                              backgroundColor: const Color(0xff0c44ac),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Select', style: TextStyle(color: Colors.white, fontSize: 16)),
                                Icon(Icons.keyboard_arrow_down_outlined, size: 22, color: Colors.white),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                // Left Section
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: const Text(
                              'Cheapest',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              color: Color(0xfffaebeb),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.luggage, size: 20, color: Color(0xff0c44ac)),
                                SizedBox(width: 4),
                                Text('Checked baggage 25 kg', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ai.png',
                            width: 70,
                          ),
                          const SizedBox(width: 15),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Air India', style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.bolt, size: 18, color: Color(0xff0c44ac)),
                                  SizedBox(width: 6),
                                  Icon(Icons.restaurant, size: 15, color: Color(0xff0c44ac)),
                                  SizedBox(width: 9),
                                  Icon(Icons.tv, size: 15, color: Color(0xff0c44ac)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Center Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('00:55', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('DEL T3', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    children: [
                      const Text('12h 35m', style: TextStyle(fontSize: 14, color: Colors.black)),
                      const SizedBox(height: 4),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Divider(thickness: 1.5, color: Colors.grey.shade300, indent: 10, endIndent: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                              Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.rectangle)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text('Direct', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('19:00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('SYD T1', style: TextStyle(fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // Right Section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('AU\$ 2,546', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Return', style: TextStyle(fontSize: 12, color: Colors.black)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4, width: 15,),
                    Container(
                      clipBehavior: Clip.none,
                      decoration: const BoxDecoration(), // Required for clipBehavior to take effect
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                              backgroundColor: const Color(0xff0c44ac),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Select', style: TextStyle(color: Colors.white, fontSize: 16)),
                                Icon(Icons.keyboard_arrow_down_outlined, size: 22, color: Colors.white),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
