/*import 'dart:async';

import 'package:pedometer/pedometer.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class StepCounterWidget extends StatefulWidget {
  @override
  _StepCounterWidgetState createState() => _StepCounterWidgetState();
}

class _StepCounterWidgetState extends State<StepCounterWidget> {
  int stepCount = 0;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Step count: $stepCount');
  }

  void _requestPermission() async {
    if (await Permission.activityRecognition.request().isGranted) {
      // Permission is granted
      _startListening();
    } else {
      // Permission is not granted
      // You can show an alert dialog to the user to explain why the permission is needed
    }
  }

  void _startListening() {
    // Start listening to step count sensor and update the step count
    // You can use the code you have implemented for this
  }
}
*/

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(StepCount());
}

class StepCount extends StatefulWidget {
  @override
  _StepCountState createState() => _StepCountState();
}


class _StepCountState extends State<StepCount> {
  int _stepCount = 0;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _stepCount++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compteur de pas'),
      ),
      body: Center(
        child: Text(
          'Nombre de pas: $_stepCount',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

