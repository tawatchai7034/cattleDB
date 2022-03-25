// Create a Form widget.
import 'package:cattle_db/db/dbHelper.dart';
import 'package:cattle_db/screens/catPro_screen.dart';
import 'package:flutter/material.dart';

import 'package:cattle_db/models/catPro.dart';

class CatProForm extends StatefulWidget {
  final CatPro? catPro;
  const CatProForm({
    Key? key,
    this.catPro,
  }) : super(key: key);

  @override
  CatProFormState createState() {
    return CatProFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CatProFormState extends State<CatProForm> {
  final _formKey = GlobalKey<FormState>();
  String _selectedGender = 'male';
  bool gender = false;
  String dropdownValue = 'Species';
  String cattleName = "";

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Cattle Profile Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  } else {
                    cattleName = value;
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              Text("Gender",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListTile(
                leading: Radio<String>(
                  value: 'male',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                      gender = false;
                    });
                  },
                ),
                title: const Text('Male'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'female',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                      gender = true;
                    });
                  },
                ),
                title: const Text('Female'),
              ),
              SizedBox(
                height: 16,
              ),
              Text("Species",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 360,
                height: 64,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  )),
                  value: dropdownValue,
                  items: <String>['Species', 'Brahman', 'Angus', 'Charolais']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 44, vertical: 16),
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 44, vertical: 16),
                              textStyle: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //       content: Text('Processing Data')),
                              // );
                              // print(
                              //     "Name: $cattleName\tGender: $_selectedGender\tSpecies: $dropdownValue");
                              final cattlePro = widget.catPro!.copy(
                                  name: cattleName,
                                  gender: gender,
                                  species: dropdownValue);
                              await CattleDB.instance.updateCatPro(cattlePro);

                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => CatProScreen()),
                                  (Route<dynamic> route) => false);
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
