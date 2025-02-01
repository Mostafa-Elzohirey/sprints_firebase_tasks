import 'package:flutter/material.dart';
import 'package:sprints_firebase_tasks/models/data.dart';
import 'package:sprints_firebase_tasks/services/firestore_services.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({super.key});

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  late Data data = Data(id: '', name: '', age: '', hobby: '');
  void getData() async {
    data = await FirestoreServices.getData("1738443661964");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: Text('Display'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'name: ${data.name}',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'age: ${data.age}',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'hobby: ${data.hobby}',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
