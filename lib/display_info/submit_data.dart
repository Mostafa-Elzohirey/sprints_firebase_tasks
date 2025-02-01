import 'package:flutter/material.dart';
import 'package:sprints_firebase_tasks/services/firestore_services.dart';

import 'display_data.dart';

class SubmitData extends StatelessWidget {
  SubmitData({super.key});
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final ageController = TextEditingController();

  final hobbyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: Text('Submit'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'name',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter name";
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'age',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter name";
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'favorite hobby',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: hobbyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter name";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Map<String, String> data = {
                          'id': DateTime.now().millisecondsSinceEpoch.toString(),
                          'name': nameController.text,
                          'age': ageController.text,
                          'hobby': hobbyController.text,
                        };
                        try {
                          FirestoreServices.addData(data);
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: Text(
                      'Submit data',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DisplayData(),
                        ),
                      );
                    },
                    child: Text(
                      'Display data',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
