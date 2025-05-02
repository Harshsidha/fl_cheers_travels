import 'package:flutter/material.dart';
import '../services/offer_api_service.dart';
import '../models/flight_offer.dart';

class TopFlightOffers extends StatefulWidget {
  const TopFlightOffers({Key? key}) : super(key: key);
  @override
  State<TopFlightOffers> createState() => _TopFlightOffersState();
}

class _TopFlightOffersState extends State<TopFlightOffers> {
  final List<Map<String, String>> offers = [
    {"title": "Indonesia", "image": "assets/images/offersImage1.png"},
    {"title": "Thailand", "image": "assets/images/offersImage2.jpg"},
    {"title": "Vietnam", "image": "assets/images/offersImage3.jpg"},
    {"title": "Malaysia", "image": "assets/images/offersImage4.jpg"},
    {"title": "Japan", "image": "assets/images/offersImage5.jpg"},
    {"title": "Philippines", "image": "assets/images/offersImage6.jpg"},
  ];

  bool isLoading = false;

  // Function to fetch flight deals for a specific destination
  Future<void> _fetchDealsForDestination(String destination) async {
    setState(() {
      isLoading = true;
    });

    try {
      final deals = await FlightDealService.fetchDeals();

      // Filter deals for selected destination if needed
      final filteredDeals = deals.where((deal) =>
          deal.destination.toLowerCase().contains(destination.toLowerCase())).toList();

      // Show the deals in a modal bottom sheet
      if (mounted) {
        _showDealsBottomSheet(destination, filteredDeals.isEmpty ? deals : filteredDeals);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load flight deals: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  // Function to display the deals in a bottom sheet
  void _showDealsBottomSheet(String destination, List<FlightDeal> deals) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff0c44ac),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Flight Deals to $destination',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: deals.isEmpty
                  ? const Center(child: Text('No deals available for this destination'))
                  : ListView.builder(
                controller: scrollController,
                itemCount: deals.length,
                itemBuilder: (context, index) {
                  final deal = deals[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                deal.destination,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xff0c44ac),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '\$${deal.price}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'From: ${deal.departureCity}',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Travel dates: ${deal.travelDates}',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              // Navigate to booking screen or details page
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Booking functionality to be implemented')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0c44ac),
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(fontWeight: FontWeight.bold),
                              minimumSize: const Size(double.infinity, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Book Now'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Top Flight Offers',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Cheers Travel stands as one of the largest retail and online travel agencies. Accessing budget-friendly flights is easy; you can visit us at our office in Murray Bridge, call our contact centre, or simply explore our website',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff434343),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 30),
          GridView.builder(
            shrinkWrap: true,
            itemCount: offers.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, index) {
              final offer = offers[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      offer['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          offer['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _fetchDealsForDestination(offer['title']!),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: isLoading
                                ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Color(0xff0c44ac),
                              ),
                            )
                                : const Text(
                              'View Flights',
                              style: TextStyle(
                                color: Color(0xff0c44ac),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: () {
              // Show all available deals
              _fetchDealsForDestination("");
            },
            label: const Text(
              "Search more Flights",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xff0c44ac)),
            ),
            icon: const Icon(Icons.arrow_forward, color: Color(0xff0c44ac)),
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xff0c44ac)),
            ),
          )
        ],
      ),
    );
  }
}