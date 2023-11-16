import 'package:c1786/data/hive_dart_store.dart';
import 'package:c1786/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class HikeForm extends StatefulWidget {

  final Function(List<int>) onDataSubmitted;
  HikeForm({Key? key, required this.onDataSubmitted}) : super(key:key);

  @override
  _HikeFormState createState() => _HikeFormState();
}

class _HikeFormState extends State<HikeForm> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _dateController = TextEditingController();
  final _parkingController = TextEditingController();
  final _lengthController = TextEditingController();
  final _difficultyController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _customField1Controller = TextEditingController();
  String? selectedDifficulty;
  final _formKey = GlobalKey<FormState>();
  bool _validateDifficulty = false;
  final List<String> _difficultyLevels = ['Easy', 'Hard'];
  DateTime? _selectedDate;
  String? selectedParkingAvailability;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hike Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name of Hike *'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the name of the hike';
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location *'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the location';
                  }
                  return null;
                },
              ),

              GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null && pickedDate != _selectedDate) {
                    setState(() {
                      _selectedDate = pickedDate;
                      _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(labelText: 'Date of the Hike *'),
                    validator: (value) {
                      if (_selectedDate == null) {
                        return 'Please select the date of the hike';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              DropdownButtonFormField<String>(
                value: selectedParkingAvailability,
                onChanged: (newValue) {
                  setState(() {
                    selectedParkingAvailability = newValue;
                  });
                },
                items: ['Yes', 'No'].map((availability) {
                  return DropdownMenuItem<String>(
                    value: availability,
                    child: Text(availability),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Parking Available *',
                  errorText: selectedParkingAvailability == null
                      ? 'Please specify if parking is available'
                      : null,
                ),
                validator: (value) {
                  if (selectedParkingAvailability == null) {
                    return 'Please specify if parking is available';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lengthController,
                decoration: InputDecoration(labelText: 'Length of Hike *'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the length of the hike';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: selectedDifficulty,
                onChanged: (newValue) {
                  setState(() {
                    selectedDifficulty = newValue;
                  });
                },
                items: _difficultyLevels.map((difficulty) {
                  return DropdownMenuItem<String>(
                    value: difficulty,
                    child: Text(difficulty),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Level of Difficulty *',
                  errorText: _validateDifficulty ? 'Please select the level of difficulty' : null,
                ),
              ),


              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description (Optional)'),
              ),
              TextFormField(
                controller: _customField1Controller,
                decoration: InputDecoration(labelText: 'Custom Field 1 *'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter Custom Field 1';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Form is valid, handle the data here
                    // You can access the form values using _nameController.text, _locationController.text, etc.
                      List<int> newData = [1, 2, 3];

                      widget.onDataSubmitted(newData);
                    // Retrieve the data from controllers
                    String name = _nameController.text;
                    String location = _locationController.text;
                    String lengthofhike = _lengthController.text;
                    String description = _descriptionController.text;
                    String customField = _customField1Controller.text;
                    DateTime createDate = DateTime.now();
                    String parkingAvailable = selectedParkingAvailability ?? "";
                    String levelofDifficulty = selectedDifficulty ?? "";

                    // Create a Plan object
                    Plan newPlan = Plan.create(
                      name: name,
                      location: location,
                      lengthofhike: lengthofhike,
                      Description: description,
                      customField: customField,
                      CreateaDate: createDate,
                      parkingAvailable: parkingAvailable,
                      levelofDifficulty: levelofDifficulty,
                    );

                    // Add the Plan object to the database
                    HiveDateStore().addPlan(plan: newPlan);

                    // Dispose of the controllers
                    _nameController.dispose();
                    _locationController.dispose();
                    _dateController.dispose();
                    _parkingController.dispose();
                    _lengthController.dispose();
                    _difficultyController.dispose();
                    _descriptionController.dispose();
                    _customField1Controller.dispose();

                    // Close the form
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}