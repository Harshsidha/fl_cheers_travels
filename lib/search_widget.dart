import 'package:flutter/material.dart';
import 'models/flight_suggestion.dart';
import 'services/flight_service.dart';

class FlightBookingSection extends StatefulWidget {
  const FlightBookingSection({super.key});
  @override
  _FlightBookingSectionState createState() => _FlightBookingSectionState();
}

enum TripType { returnTrip, oneWay, multiCity }

class _FlightBookingSectionState extends State<FlightBookingSection> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  List<FlightSuggestion> _fromSuggestions = [];
  List<FlightSuggestion> _toSuggestions = [];
  bool _isLoadingFrom = false;
  bool _isLoadingTo = false;
  bool _isFromFocused = false;
  bool _isToFocused = false;
  TripType _selectedTrip = TripType.returnTrip;
  bool isChecked = false;

  // Keep track of selected suggestions for display in textbox
  FlightSuggestion? _selectedFromSuggestion;
  FlightSuggestion? _selectedToSuggestion;

  void _onFromTextChanged(String text) async {
    if (text.length < 2) {
      setState(() => _fromSuggestions = []);
      return;
    }

    setState(() => _isLoadingFrom = true);
    try {
      final results = await FlightService.fetchSuggestions(text);
      setState(() {
        _fromSuggestions = results;
        _isLoadingFrom = false;
      });
    } catch (e) {
      setState(() {
        _fromSuggestions = [];
        _isLoadingFrom = false;
      });
    }
  }

  void _onToTextChanged(String text) async {
    if (text.length < 2) {
      setState(() => _toSuggestions = []);
      return;
    }

    setState(() => _isLoadingTo = true);
    try {
      final results = await FlightService.fetchSuggestions(text);
      setState(() {
        _toSuggestions = results;
        _isLoadingTo = false;
      });
    } catch (e) {
      setState(() {
        _toSuggestions = [];
        _isLoadingTo = false;
      });
    }
  }

  void _selectFromSuggestion(FlightSuggestion suggestion) {
    // Only update the textbox with the city code
    _fromController.text = suggestion.cityCode;
    setState(() {
      _selectedFromSuggestion = suggestion; // Store the full suggestion
      _fromSuggestions = [];
      _isFromFocused = false;
    });
  }

  void _selectToSuggestion(FlightSuggestion suggestion) {
    // Only update the textbox with the city code
    _toController.text = suggestion.cityCode;
    setState(() {
      _selectedToSuggestion = suggestion; // Store the full suggestion
      _toSuggestions = [];
      _isToFocused = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/homebanner.jpg', // Add your image to assets folder
          width: double.infinity,
          height: 700,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 700,
          color: Colors.black.withOpacity(0.4),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text("Where Every Journey", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.0,
              ),),
              Text("Become An Adventure", style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.0,
              ),),
              SizedBox(height: 20,),
              Container(
                width: 1220,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildRadioOption(TripType.returnTrip, 'Return'),
                          const SizedBox(width: 16),
                          buildRadioOption(TripType.oneWay, 'One Way'),
                          const SizedBox(width: 16),
                          buildRadioOption(TripType.multiCity, 'Multi-City'),
                          const SizedBox(width: 20),
                          Container(height: 17, width: 1, color: Colors.black54,),
                          const SizedBox(width: 15),
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Color(0xff0c44ac); // background color when checked
                                  }
                                  return Colors.white; // background color when unchecked
                                }),
                              ),
                              Text("Direct flights"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        // From field with suggestions
                        Stack(
                          children: [
                            Container(
                              width: 230,
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3.8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Color(0xff767b8e),
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 35),
                                    child: Text(
                                      "From",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff494949),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 0),
                                  Row(
                                    children: [
                                      SizedBox(width: 5),
                                      const Icon(Icons.local_airport, color: Color(0xff313541), size: 25),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Focus(
                                          onFocusChange: (hasFocus) {
                                            setState(() {
                                              _isFromFocused = hasFocus;
                                            });
                                          },
                                          child: TextField(
                                            controller: _fromController,
                                            onChanged: _onFromTextChanged,
                                            decoration: InputDecoration(
                                              hintText: "Flying From",
                                              hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold
                                              ),
                                              border: InputBorder.none,
                                              isCollapsed: true,
                                              contentPadding: EdgeInsets.zero,
                                            ),
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (_selectedFromSuggestion != null)
                                    Padding(
                                      padding: EdgeInsets.only(left: 35),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _selectedFromSuggestion!.cityName,
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xff494949),
                                            ),
                                          ),
                                          Text(
                                            _selectedFromSuggestion!.airportName,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff767b8e),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    )
                                  else
                                    Padding(
                                      padding: EdgeInsets.only(left: 35),
                                      child: Text(
                                        "Airport/City Name",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xff494949),
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            // From suggestions dropdown
                            if (_isFromFocused && (_fromSuggestions.isNotEmpty || _isLoadingFrom))
                              Positioned(
                                top: 57,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: _isLoadingFrom
                                      ? Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Color(0xff0c44ac),
                                    ),
                                  )
                                      : Column(
                                    children: _fromSuggestions.map((suggestion) {
                                      return InkWell(
                                        onTap: () => _selectFromSuggestion(suggestion),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${suggestion.cityName}, ${suggestion.countryName}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                suggestion.airportName,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(width: 8),
                        // To field with suggestions
                        Stack(
                          children: [
                            Container(
                              width: 234,
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3.8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Color(0xff767b8e),
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 35),
                                    child: Text(
                                      "To",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff494949),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 0),
                                  Row(
                                    children: [
                                      SizedBox(width: 5),
                                      const Icon(Icons.local_airport, color: Color(0xff313541), size: 25),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Focus(
                                          onFocusChange: (hasFocus) {
                                            setState(() {
                                              _isToFocused = hasFocus;
                                            });
                                          },
                                          child: TextField(
                                            controller: _toController,
                                            onChanged: _onToTextChanged,
                                            decoration: InputDecoration(
                                              hintText: "Flying To",
                                              hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold
                                              ),
                                              border: InputBorder.none,
                                              isCollapsed: true,
                                              contentPadding: EdgeInsets.zero,
                                            ),
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (_selectedToSuggestion != null)
                                    Padding(
                                      padding: EdgeInsets.only(left: 35),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _selectedToSuggestion!.cityName,
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xff494949),
                                            ),
                                          ),
                                          Text(
                                            _selectedToSuggestion!.airportName,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff767b8e),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    )
                                  else
                                    Padding(
                                      padding: EdgeInsets.only(left: 35),
                                      child: Text(
                                        "Airport/City Name",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xff494949),
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            // To suggestions dropdown
                            if (_isToFocused && (_toSuggestions.isNotEmpty || _isLoadingTo))
                              Positioned(
                                top: 57,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: _isLoadingTo
                                      ? Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Color(0xff0c44ac),
                                    ),
                                  )
                                      : Column(
                                    children: _toSuggestions.map((suggestion) {
                                      return InkWell(
                                        onTap: () => _selectToSuggestion(suggestion),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${suggestion.cityName}, ${suggestion.countryName}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                suggestion.airportName,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 170,
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Color(0xff767b8e),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 36),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Departure",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff494949),
                                        ),
                                      ),
                                      Icon(Icons.keyboard_arrow_down, color: Color(0xff494949),size: 20,),
                                    ],
                                  )
                              ),
                              const SizedBox(height: 0),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  const Icon(Icons.date_range, color: Color(0xff494949), size: 25),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Date",
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold
                                        ),
                                        border: InputBorder.none,
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 0),
                              Padding(
                                padding: EdgeInsets.only(left: 36),
                                child: Text(
                                  "Day",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xff494949),
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 170,
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Color(0xff767b8e),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 36),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Return",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff494949),
                                        ),
                                      ),
                                      Icon(Icons.keyboard_arrow_down, color: Color(0xff494949),size: 20,),
                                    ],
                                  )
                              ),
                              const SizedBox(height: 0),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  const Icon(Icons.date_range, color: Color(0xff494949), size: 25),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Date",
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold
                                        ),
                                        border: InputBorder.none,
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 0),
                              Padding(
                                padding: EdgeInsets.only(left: 36),
                                child: Text(
                                  "Day",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff0c223f),
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 180,
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Color(0xff767b8e),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 36),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Travellers & Class",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff494949),
                                        ),
                                      ),
                                      Icon(Icons.keyboard_arrow_down, color: Color(0xff494949),size: 20,),
                                    ],
                                  )
                              ),
                              const SizedBox(height: 0),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  const Icon(Icons.account_circle, color: Color(0xff494949), size: 26),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "1 Travellers",
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold
                                        ),
                                        border: InputBorder.none,
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 0),
                              Padding(
                                padding: EdgeInsets.only(left: 37),
                                child: Text(
                                  "Economy",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff0c223f),
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        TextButton(
                          onPressed: (){},
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xff0c44ac),
                            padding: EdgeInsets.symmetric(vertical: 31, horizontal: 27),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.white, size: 27,),
                              Text('Search'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 17,),)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: 1230,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/reviewImg.png', // Add your image to assets folder
                      height: 34,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
  Widget buildRadioOption(TripType value, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<TripType>(
          value: value,
          groupValue: _selectedTrip,
          activeColor: Color(0xff005dad), // Red selection like in the image
          onChanged: (TripType? newValue) {
            setState(() {
              _selectedTrip = newValue!;
            });
          },
        ),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}