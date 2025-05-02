import 'package:flutter/material.dart';

class FlightFilterPanel extends StatefulWidget {
  const FlightFilterPanel({super.key});

  @override
  State<FlightFilterPanel> createState() => _FlightFilterPanelState();
}
class AirlineOption {
  final String name;
  final String price;
  bool isSelected;

  AirlineOption({required this.name, required this.price, this.isSelected = false});
}
List<AirlineOption> airlineOptions = [
  AirlineOption(name: "Air India (8)", price: "AU\$ 2,546"),
  AirlineOption(name: "Thai Airways (3)", price: "AU\$ 2,559"),
  AirlineOption(name: "Virgin Australia (3)", price: "AU\$ 3,373"),
  AirlineOption(name: "Etihad Airways (2)", price: "AU\$ 2,625"),
  AirlineOption(name: "Qantas Airways (2)", price: "AU\$ 3,211"),
];


class _FlightFilterPanelState extends State<FlightFilterPanel> {
  // Switch
  bool selectFlightsIndividually = true;

  // Recommended checkboxes
  bool directOnly = false;
  bool baggageIncluded = false;
  bool hideBudgetAirlines = false;
  bool oneworldSelected = false;
  bool starAllianceSelected = false;



  // Sliders
  RangeValues departureTime = const RangeValues(0, 24);
  RangeValues arrivalTime = const RangeValues(0, 24);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
       Container(
         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(12), // Set your desired radius here
         ),
         child:  _buildSwitchTile(
           "Select flights individually",
           selectFlightsIndividually,
               (val) => setState(() => selectFlightsIndividually = val),
         ),
       ),

        const SizedBox(height: 15),
        const Text("Recommended", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCheckbox("Direct", directOnly, (val) {
              setState(() => directOnly = val ?? false);
            }),
            _buildCheckbox("Checked baggage included", baggageIncluded, (val) {
              setState(() => baggageIncluded = val ?? false);
            }),
            _buildCheckbox("Hide budget airlines", hideBudgetAirlines, (val) {
              setState(() => hideBudgetAirlines = val ?? false);
            }),
          ],
        ),

        _buildShowMore(),

        _buildDivider(),

        const Text("Alliance", style: TextStyle(fontWeight: FontWeight.bold)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAllianceTile("Oneworld", "AU\$ 3,211", oneworldSelected, (val) {
              setState(() => oneworldSelected = val ?? false);
            }),
            _buildAllianceTile("Star Alliance", "AU\$ 2,546", starAllianceSelected, (val) {
              setState(() => starAllianceSelected = val ?? false);
            }),
          ],
        ),

        _buildDivider(),

        const Text("Airlines", style: TextStyle(fontWeight: FontWeight.bold)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(airlineOptions.length, (index) {
            final airline = airlineOptions[index];
            return _buildAirlineTile(airline, (val) {
              setState(() => airline.isSelected = val ?? false);
            });
          }),
        ),

        _buildShowMore(),

        _buildDivider(),

        _buildSectionHeader("Times"),
        const Text("Departure Time  00:00 – 24:00"),
        RangeSlider(
          values: departureTime,
          min: 0,
          max: 24,
          divisions: 24,
          labels: RangeLabels(
            "${departureTime.start.round()}:00",
            "${departureTime.end.round()}:00",
          ),
          onChanged: (value) => setState(() => departureTime = value),
        ),

        const Text("Arrival Time  00:00 – 24:00"),
        RangeSlider(
          values: arrivalTime,
          min: 0,
          max: 24,
          divisions: 24,
          labels: RangeLabels(
            "${arrivalTime.start.round()}:00",
            "${arrivalTime.end.round()}:00",
          ),
          onChanged: (value) => setState(() => arrivalTime = value),
        ),

        _buildDivider(),

        _buildSectionHeader("Stops"),
        _buildRadioTile("1 stop or fewer", "AU\$ 2,546",),

        _buildDivider(),

        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            title: const Text(
              "Stopover Cities",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: const [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Any"),
              ),
            ],
          ),
        ),
        _buildDivider(),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            title: const Text(
              "Stopover Cities",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: const [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Any"),
              ),
            ],
          ),
        ),
        SizedBox(height: 30,),

      ],
    );
  }

  Widget _buildSwitchTile(String title, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }

  Widget _buildCheckbox(String title, bool value, ValueChanged<bool?> onChanged) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero, // Removes default left/right padding
      dense: true, // Makes the tile more compact vertically
      visualDensity: VisualDensity(vertical: -4), // Adjust vertical spacing
      title: Text(title, style: TextStyle(fontSize: 14)), // Optional: smaller text
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
    );
  }


  Widget _buildAllianceTile(String name, String price, bool value, ValueChanged<bool?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        contentPadding: EdgeInsets.zero,
        leading: Checkbox(
          value: value,
          onChanged: onChanged,
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        title: Text(name, style: TextStyle(fontSize: 14)),
        trailing: Text(price, style: TextStyle(fontSize: 14)),
      ),
    );
  }



  Widget _buildAirlineTile(AirlineOption airline, ValueChanged<bool?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        contentPadding: EdgeInsets.zero,
        leading: Checkbox(
          value: airline.isSelected,
          onChanged: onChanged,
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        title: Text(airline.name, style: TextStyle(fontSize: 14)),
        trailing: Text(airline.price, style: TextStyle(fontSize: 14)),
      ),
    );
  }


  Widget _buildRadioTile(String label, String price) {
    return ListTile(
      leading: Radio(value: true, groupValue: true, onChanged: (val) {}),
      title: Text(label),
      trailing: Text(price, style: TextStyle(fontSize: 14,),),
      contentPadding: EdgeInsets.all(0),
    );
  }

  Widget _buildDivider() => const Divider(height: 20);

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildShowMore() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {},
        child: const Text(
          "Show More",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
