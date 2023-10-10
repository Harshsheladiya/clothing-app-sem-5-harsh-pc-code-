import 'package:flutter/material.dart';



class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController organisationController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();
  bool isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Prepare your card'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    elevation: 2.0, // Add elevation for the card border
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(), // Add border here
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Card(
                    elevation: 2.0, // Add elevation for the card border
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(), // Add border here
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Card(
                    elevation: 2.0, // Add elevation for the card border
                    child: TextFormField(
                      controller: occupationController,
                      decoration: InputDecoration(
                        labelText: 'Current Occupation',
                        border: OutlineInputBorder(), // Add border here
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Card(
                    elevation: 2.0, // Add elevation for the card border
                    child: TextFormField(
                      controller: organisationController,
                      decoration: InputDecoration(
                        labelText: 'Organisation',
                        border: OutlineInputBorder(), // Add border here
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Card(
                    elevation: 2.0, // Add elevation for the card border
                    child: TextFormField(
                      controller: linkedinController,
                      decoration: InputDecoration(
                        labelText: 'LinkedIn',
                        border: OutlineInputBorder(), // Add border here
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Get user-entered data
                      String firstName = firstNameController.text;
                      String lastName = lastNameController.text;
                      String occupation = occupationController.text;
                      String organisation = organisationController.text;
                      String linkedin = linkedinController.text;

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('User Details'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('First Name: $firstName'),
                                Text('Last Name: $lastName'),
                                Text('Current Occupation: $occupation'),
                                Text('Organisation: $organisation'),
                                Text('LinkedIn: $linkedin'),
                                Text('Subscribed to newsletter: $isSubscribed'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    occupationController.dispose();
    organisationController.dispose();
    linkedinController.dispose();
    super.dispose();
  }
}
