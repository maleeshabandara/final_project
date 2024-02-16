import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//First Screen
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "New App",
      home: BloodPressure(),
    );
  }
}

class BloodPressure extends StatefulWidget {
  const BloodPressure({Key? key});

  @override
  State<BloodPressure> createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
  TextEditingController systolicController = TextEditingController();
  TextEditingController diastolicController = TextEditingController();

  @override
  void dispose() {
    systolicController.dispose();
    diastolicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check your Blood pressure"),
        backgroundColor: Color.fromARGB(255, 253, 238, 74),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: systolicController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(hintText: 'Systolic blood pressure'),
                style: TextStyle(fontSize: 25.00),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: diastolicController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(hintText: 'Diastolic blood pressure'),
                style: TextStyle(fontSize: 25.00),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  final systolic = int.tryParse(systolicController.text);
                  final diastolic = int.tryParse(diastolicController.text);
                  String result;
                  if (systolic != null && diastolic != null) {
                    if (systolic < 90 && diastolic < 60) {
                      result = 'Low Blood Pressure';
                    } else if (systolic >= 90 && systolic < 120 && diastolic >= 60 && diastolic < 80) {
                      result = 'Normal Blood Pressure';
                    } else if (systolic >= 120 && systolic < 140 && diastolic >= 80 && diastolic < 90) {
                      result = 'Hypertension Stage 1';
                    } else if (systolic >= 140 && systolic < 160 && diastolic >= 90 && diastolic < 100) {
                      result = 'Hypertension Stage 2';
                    } else if (systolic >= 160 && diastolic >= 100) {
                      result = 'Hypertensive crisis';
                    } else {
                      result = 'Unknown';
                    }
                  } else {
                    result = 'Invalid input';
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(
                        systolic: systolicController.text,
                        diastolic: diastolicController.text,
                        result: result,
                      ),
                    ),
                  );
                },
                child: Text('Check'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed:(){Navigator.push(
                      context,MaterialPageRoute(
                        builder: (context) => ThirdPage()),
                             );
                            },
                            child: Text('Info'),
                          )
                        ],
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
//Second screen
class SecondPage extends StatelessWidget {
  final String systolic;
  final String diastolic;
  final String result;

  const SecondPage({required this.systolic, required this.diastolic, required this.result, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Pressure Result"),
        backgroundColor: Color.fromARGB(255, 253, 238, 74),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Systolic Blood Pressure: $systolic',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Diastolic Blood Pressure: $diastolic',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Blood Pressure Result: $result',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
 
  //Third screen

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(title: Text("Blood Pressure Information Details"),
      backgroundColor: Color.fromARGB(255, 253, 238, 74),),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Image.asset("assets/asset3.jpg",height: 1000,),
      )
      );
  }
}