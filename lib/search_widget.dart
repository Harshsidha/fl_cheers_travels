import 'package:flutter/material.dart';
import 'models/flight_suggestion.dart';
import 'services/flight_service.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'result_page.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

enum TripType { returnTrip, oneWay, multiCity }

class TravellersClassPicker extends StatefulWidget {
  const TravellersClassPicker({Key? key}) : super(key: key);

  @override
  State<TravellersClassPicker> createState() => _TravellersClassPickerState();
}



class _TravellersClassPickerState extends State<TravellersClassPicker> {
  int adults = 1;
  int children = 0;
  int infants = 0;
  String travelClass = 'Economy';

  Widget _travellerRow(
      String label,
      int count,
      void Function(void Function()) setSheetState, {
        bool allowZero = false,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                if ((allowZero && count > 0) || (!allowZero && count > 1)) {
                  setSheetState(() {
                    if (label.contains("Adults")) {
                      adults--;
                    } else if (label.contains("Children")) {
                      children--;
                    } else if (label.contains("Infant")) {
                      infants--;
                    }
                  });
                }
              },
            ),
            Text(count.toString(), style: const TextStyle(fontSize: 16)),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                setSheetState(() {
                  if (label.contains("Adults")) {
                    adults++;
                  } else if (label.contains("Children")) {
                    children++;
                  } else if (label.contains("Infant")) {
                    infants++;
                  }
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  void _openTravellersClassPicker() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Traveller Class Picker",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.white,
            child: StatefulBuilder(
              builder: (context, setSheetState) {
                return Container(
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.all(16),
                  height: 300,
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 270,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _travellerRow("Adults", adults, setSheetState),
                                Container(
                                  height: 1,
                                  color: Color(0xffdbdbdb),
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                ),
                                _travellerRow(
                                  "Children (2 - 11 Years)",
                                  children,
                                  setSheetState,
                                  allowZero: true,
                                ),
                                Container(
                                  height: 1,
                                  color: Color(0xffdbdbdb),
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                ),
                                _travellerRow(
                                  "Infant (Under 2 Years)",
                                  infants,
                                  setSheetState,
                                  allowZero: true,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Select Class",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                direction: Axis.vertical,
                                spacing: 8,
                                children:
                                [
                                  'Economy',
                                  'Premium Economy',
                                  'Business',
                                  'First',
                                ]
                                    .map(
                                      (value) => ChoiceChip(
                                    label: Text(value),
                                    selected: travelClass == value,
                                    onSelected: (selected) {
                                      if (selected) {
                                        setSheetState(
                                              () => travelClass = value,
                                        );
                                      }
                                    },
                                  ),
                                )
                                    .toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Container(
                        height: 1,
                        color: Color(0xffdbdbdb),
                        margin: EdgeInsets.only(top: 0, bottom: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {}); // Update main UI
                              Navigator.pop(context); // Close the modal
                            },
                            child: const Text("Done"),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  int get totalTravellers => adults + children + infants;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return GestureDetector(
      onTap: _openTravellersClassPicker,
      child: Container(
        width: isSmallScreen ? 140 : 180,
        padding: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xff767b8e), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: isSmallScreen ? 20 : 36),
              child: Row(
                children: [
                  Text(
                    "Travellers & Class",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 10 : 12,
                      color: Color(0xff494949),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xff494949),
                    size: 20,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 5),
                const Icon(
                  Icons.account_circle,
                  color: Color(0xff494949),
                  size: 26,
                ),
                const SizedBox(width: 5),
                Text(
                  "$totalTravellers Traveller${totalTravellers > 1 ? 's' : ''}",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: isSmallScreen ? 30 : 37),
              child: Text(
                travelClass,
                style: TextStyle(
                  fontSize: isSmallScreen ? 10 : 12,
                  color: Color(0xff0c223f),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchWidgetState extends State<SearchWidget> {
  DateTime? _startDate;
  DateTime? _endDate;

  void _openDateRangePicker() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(8),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 350,
            child: SfDateRangePicker(
              selectionMode: DateRangePickerSelectionMode.range,
              showActionButtons: true,
              onSubmit: (Object? val) {
                if (val is PickerDateRange) {
                  setState(() {
                    _startDate = val.startDate;
                    _endDate = val.endDate;
                  });
                }
                Navigator.pop(context);
              },
              onCancel: () => Navigator.pop(context),
              initialSelectedRange: PickerDateRange(
                _startDate ?? DateTime.now(),
                _endDate ?? DateTime.now().add(const Duration(days: 2)),
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "Date";
    return "${date.day}/${date.month}/${date.year}";
  }

  String _formatDay(DateTime? date) {
    if (date == null) return "Day";
    return ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"][date.weekday % 7];
  }

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
  FlightSuggestion? _selectedFromSuggestion;
  FlightSuggestion? _selectedToSuggestion;



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  void _onFromTextChanged(String text) async {
    if (text.length < 2) {
      setState(() => _fromSuggestions = []);
      return;
    }

    final results = await FlightService.fetchSuggestions(text);
    if (_fromController.text == text) {
      setState(() => _fromSuggestions = results);
    }
  }

  void _onToTextChanged(String text) async {
    if (text.length < 2) {
      setState(() => _toSuggestions = []);
      return;
    }

    final results = await FlightService.fetchSuggestions(text);
    if (_toController.text == text) {
      setState(() => _toSuggestions = results);
    }
  }

  void _selectFromSuggestion(FlightSuggestion suggestion) {
    _fromController.text =
    '${suggestion.cityName}, ${suggestion.airportName} (${suggestion.cityCode})';
    setState(() {
      _selectedFromSuggestion = suggestion;
      _fromSuggestions = [];
    });
    FocusScope.of(context).unfocus();
  }

  void _selectToSuggestion(FlightSuggestion suggestion) {
    _toController.text =
    '${suggestion.cityName}, ${suggestion.airportName} (${suggestion.cityCode})';
    setState(() {
      _selectedToSuggestion = suggestion;
      _toSuggestions = [];
    });
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 768;
    final isMediumScreen = screenWidth >= 768 && screenWidth < 1024;

    return Stack(
      children: [
        Image.asset(
          'assets/images/homebanner.jpg',
          width: double.infinity,
          height: isSmallScreen ? 700 : 440,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: isSmallScreen ?  700 : 440,
          color: Colors.black.withOpacity(0.4),
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 10 : 20,
            vertical: isSmallScreen ? 20 : 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: isSmallScreen ? 10 : 30),
              Text(
                "Where Every Journey",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 18 : 25,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.0,
                ),
              ),
              Text(
                "Become An Adventure",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmallScreen ? 24 : 34,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(height: isSmallScreen ? 10 : 20),
              Container(
                width: isSmallScreen
                    ? screenWidth * 0.95
                    : isMediumScreen
                    ? screenWidth * 0.9
                    : 1230,
                padding: EdgeInsets.all(isSmallScreen ? 10 : 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: isSmallScreen ? 5 : 10),
                      child: isSmallScreen
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              buildRadioOption(TripType.returnTrip, 'Return'),
                              SizedBox(width: 8),
                              buildRadioOption(TripType.oneWay, 'One Way'),
                            ],
                          ),
                          Row(
                            children: [
                              buildRadioOption(TripType.multiCity, 'Multi-City'),
                              SizedBox(width: 8),
                              Container(height: 17, width: 1, color: Colors.black54),
                              SizedBox(width: 8),
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
                                        return Color(0xff0c44ac);
                                      }
                                      return Colors.white;
                                    }),
                                  ),
                                  Text("Direct"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          buildRadioOption(TripType.returnTrip, 'Return'),
                          SizedBox(width: 16),
                          buildRadioOption(TripType.oneWay, 'One Way'),
                          SizedBox(width: 16),
                          buildRadioOption(TripType.multiCity, 'Multi-City'),
                          SizedBox(width: 20),
                          Container(height: 17, width: 1, color: Colors.black54),
                          SizedBox(width: 15),
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
                                    return Color(0xff0c44ac);
                                  }
                                  return Colors.white;
                                }),
                              ),
                              Text("Direct flights"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isSmallScreen
                        ? Column(
                      children: [
                        _buildFromField(isSmallScreen),
                        SizedBox(height: 8),
                        _buildToField(isSmallScreen),
                        SizedBox(height: 8),
                        _buildDateFields(isSmallScreen),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            TravellersClassPicker(),
                            SizedBox(width: 8),
                            _buildSearchButton(context, isSmallScreen),
                          ],
                        ),
                      ],
                    )
                        : Row(
                      children: [
                        _buildFromField(isSmallScreen),
                        SizedBox(width: 8),
                        _buildToField(isSmallScreen),
                        SizedBox(width: 8),
                        _buildDateFields(isSmallScreen),
                        SizedBox(width: 8),
                        TravellersClassPicker(),
                        SizedBox(width: 8),
                        _buildSearchButton(context, isSmallScreen),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: isSmallScreen ? screenWidth * 0.50 : 1230,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/reviewImg.png',
                      height: isSmallScreen ? screenWidth * 0.03 : 34,
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
  Widget _buildFromField(bool isSmallScreen) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: isSmallScreen ? double.infinity : 230,
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3.8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: const Color(0xff767b8e), width: 1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        const Icon(Icons.flight_takeoff, color: Color(0xff313541)),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Focus(
                            onFocusChange: (hasFocus) {
                              setState(() => _isFromFocused = hasFocus);
                              if (hasFocus && _fromController.text.length >= 2) {
                                _onFromTextChanged(_fromController.text);
                              }
                            },
                            child: TextField(
                              controller: _fromController,
                              onChanged: _onFromTextChanged,
                              decoration: InputDecoration(
                                hintText: "Flying From",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: isSmallScreen ? 14 : 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                                suffixIcon: _fromController.text.isNotEmpty
                                    ? IconButton(
                                  icon: const Icon(Icons.clear, size: 18),
                                  onPressed: () {
                                    _fromController.clear();
                                    setState(() {
                                      _fromSuggestions = [];
                                      _selectedFromSuggestion = null;
                                    });
                                  },
                                )
                                    : null,
                              ),
                              style: TextStyle(
                                  fontSize: isSmallScreen ? 14 : 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_isFromFocused && (_fromSuggestions.isNotEmpty || _isLoadingFrom))
                Positioned(
                  top: 50,
                  left: 0,
                  right: isSmallScreen ? 0 : null,
                  // Add a high z-index to ensure suggestions appear on top
                  child: CompositedTransformFollower(
                    link: LayerLink(),
                    showWhenUnlinked: true,
                    offset: const Offset(0, 0),
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        width: isSmallScreen ? constraints.maxWidth : 230,
                        constraints: const BoxConstraints(maxHeight: 200),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: _isLoadingFrom
                            ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                            : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _fromSuggestions.length,
                          itemBuilder: (context, index) {
                            final suggestion = _fromSuggestions[index];
                            return ListTile(
                              dense: true,
                              onTap: () => _selectFromSuggestion(suggestion),
                              title: Text(
                                '${suggestion.cityName}, ${suggestion.airportName}, ${suggestion.airportName}',
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                suggestion.airportName,
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  suggestion.cityCode,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }
    );
  }

  Widget _buildToField(bool isSmallScreen) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: isSmallScreen ? double.infinity : 230,
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3.8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: const Color(0xff767b8e), width: 1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        const Icon(Icons.flight_land, color: Color(0xff313541)),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Focus(
                            onFocusChange: (hasFocus) {
                              setState(() => _isToFocused = hasFocus);
                              if (hasFocus && _toController.text.length >= 2) {
                                _onToTextChanged(_toController.text);
                              }
                            },
                            child: TextField(
                              controller: _toController,
                              onChanged: _onToTextChanged,
                              decoration: InputDecoration(
                                hintText: "Flying To",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: isSmallScreen ? 14 : 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                                suffixIcon: _toController.text.isNotEmpty
                                    ? IconButton(
                                  icon: const Icon(Icons.clear, size: 18),
                                  onPressed: () {
                                    _toController.clear();
                                    setState(() {
                                      _toSuggestions = [];
                                      _selectedToSuggestion = null;
                                    });
                                  },
                                )
                                    : null,
                              ),
                              style: TextStyle(
                                  fontSize: isSmallScreen ? 14 : 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_isToFocused && (_toSuggestions.isNotEmpty || _isLoadingTo))
                Positioned(
                  top: 50,
                  left: 0,
                  right: isSmallScreen ? 0 : null,
                  // Add a high z-index with CompositedTransformFollower
                  child: CompositedTransformFollower(
                    link: LayerLink(),
                    showWhenUnlinked: true,
                    offset: const Offset(0, 0),
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        width: isSmallScreen ? constraints.maxWidth : 230,
                        constraints: const BoxConstraints(maxHeight: 200),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: _isLoadingTo
                            ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                            : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _toSuggestions.length,
                          itemBuilder: (context, index) {
                            final suggestion = _toSuggestions[index];
                            return ListTile(
                              dense: true,
                              onTap: () => _selectToSuggestion(suggestion),
                              title: Text(
                                '${suggestion.cityName}, ${suggestion.airportName}, ${suggestion.cityName}',
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                suggestion.airportName,
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  suggestion.cityCode,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }
    );
  }

  // Helper method to highlight matching text in suggestions
  List<TextSpan> _highlightText(String text, String query) {
    if (query.isEmpty) return [TextSpan(text: text)];

    final List<TextSpan> spans = [];
    final String lowercaseText = text.toLowerCase();
    final String lowercaseQuery = query.toLowerCase();

    int start = 0;
    int indexOfMatch;

    while (true) {
      indexOfMatch = lowercaseText.indexOf(lowercaseQuery, start);
      if (indexOfMatch == -1) {
        // No more matches, add the rest of the text
        if (start < text.length) {
          spans.add(TextSpan(text: text.substring(start)));
        }
        break;
      }

      // Add the text before the match
      if (indexOfMatch > start) {
        spans.add(TextSpan(text: text.substring(start, indexOfMatch)));
      }

      // Add the highlighted match
      spans.add(TextSpan(
        text: text.substring(indexOfMatch, indexOfMatch + query.length),
        style: const TextStyle(
          backgroundColor: Colors.yellow,
          fontWeight: FontWeight.bold,
        ),
      ));

      // Move start to after this match
      start = indexOfMatch + query.length;
    }

    return spans;
  }

  Widget _buildDateFields(bool isSmallScreen) {
    if (isSmallScreen) {
      return Column(
        children: [
          GestureDetector(
            onTap: _openDateRangePicker,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xff767b8e), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Row(
                      children: [
                        Text(
                          "Departure",
                          style: TextStyle(fontSize: 12, color: Color(0xff494949)),
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xff494949)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const Icon(Icons.date_range, color: Color(0xff494949), size: 25),
                      const SizedBox(width: 5),
                      Text(
                        _formatDate(_startDate),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: Text(
                      _formatDay(_startDate),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xff494949),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: _openDateRangePicker,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xff767b8e), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Row(
                      children: [
                        Text(
                          "Return",
                          style: TextStyle(fontSize: 12, color: Color(0xff494949)),
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xff494949)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const Icon(Icons.date_range, color: Color(0xff494949), size: 25),
                      const SizedBox(width: 5),
                      Text(
                        _formatDate(_endDate),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: Text(
                      _formatDay(_endDate),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff0c223f),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          GestureDetector(
            onTap: _openDateRangePicker,
            child: Container(
              width: 170,
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xff767b8e), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Row(
                      children: [
                        Text(
                          "Departure",
                          style: TextStyle(fontSize: 12, color: Color(0xff494949)),
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xff494949)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const Icon(Icons.date_range, color: Color(0xff494949), size: 25),
                      const SizedBox(width: 5),
                      Text(
                        _formatDate(_startDate),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: Text(
                      _formatDay(_startDate),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xff494949),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _openDateRangePicker,
            child: Container(
              width: 170,
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xff767b8e), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Row(
                      children: [
                        Text(
                          "Return",
                          style: TextStyle(fontSize: 12, color: Color(0xff494949)),
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xff494949)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      const Icon(Icons.date_range, color: Color(0xff494949), size: 25),
                      const SizedBox(width: 5),
                      Text(
                        _formatDate(_endDate),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: Text(
                      _formatDay(_endDate),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff0c223f),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }


  Widget _buildSearchButton(BuildContext context, bool isSmallScreen) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ResultPage()),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xff0c44ac),
          padding: EdgeInsets.symmetric(
            vertical: isSmallScreen ? 15 : 31,
            horizontal: isSmallScreen ? 10 : 27,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, color: Colors.white, size: isSmallScreen ? 20 : 27),
            const SizedBox(width: 5),
            Text(
              'Search'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 17 : 17,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRadioOption(TripType value, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<TripType>(
          value: value,
          groupValue: _selectedTrip,
          activeColor: Color(0xff005dad),
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