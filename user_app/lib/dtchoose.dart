import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BookVehiclePage(),
  ));
}

class BookVehiclePage extends StatefulWidget {
  @override
  _BookVehiclePageState createState() => _BookVehiclePageState();
}

class _BookVehiclePageState extends State<BookVehiclePage> {
  DateTime? _selectedDate;
  String? _selectedPickupTime;
  String? _selectedReturnTime;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedPickupTime = '11:00 am';
    _selectedReturnTime = '3:00 pm';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date & Time'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back action
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Book Our Vehicle',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CalendarDatePicker(
              initialDate: _selectedDate!,
              firstDate: DateTime.now().subtract(Duration(days: 30)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateChanged: (DateTime newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                  value: _selectedPickupTime,
                  items: <String>['10:00 am', '11:00 am', '12:00 pm']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedPickupTime = newValue;
                    });
                  },
                ),
                DropdownButton<String>(
                  value: _selectedReturnTime,
                  items: <String>['2:00 pm', '3:00 pm', '4:00 pm']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedReturnTime = newValue;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle book now action
              },
              child: Text('Book Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
