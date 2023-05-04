import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?';
  int _steps = 0;
  double _distanceInMeters = 0;
  double _caloriesBurned = 0;
  double _weightInKilograms = 70; // weight of the user in kilograms
  double _stepLengthInMeters = 0.6; // average step length in meters



  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps;
      _distanceInMeters = _steps * _stepLengthInMeters;
      _caloriesBurned = _weightInKilograms * _distanceInMeters * 0.3;
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available' as int;
    });
  }

  Future<void> initPlatformState() async {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    if (await Permission.activityRecognition.request().isGranted) {
      _stepCountStream = Pedometer.stepCountStream;
      _stepCountStream.listen(onStepCount).onError(onStepCountError);
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pedometer example app'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF6E00FF),
                Color(0xFF00C6FF),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Steps taken:',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Text(
                  '${_steps.toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.directions_walk, color: Colors.black, size: 40),
                        SizedBox(height: 10),
                        Text(
                          'Distance',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          '${_distanceInMeters.toStringAsFixed(2)} m',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.local_fire_department, color: Colors.red, size: 40),
                        SizedBox(height: 10),
                        Text(
                          'Calories',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          '${_caloriesBurned.toStringAsFixed(2)} cal',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 100,
                  thickness: 0,
                  color: Colors.white
                  ,
                ),

                Text(
                  'Pedestrian status:',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),

                Icon(
                  _status == 'walking'
                      ? Icons.directions_walk
                      : _status == 'stopped'
                      ? Icons.accessibility_new
                      : Icons.error,
                  size: 100,
                  color: Colors.white,
                ),
                Center(
                  child: Text(
                    _status,
                    style: _status == 'walking' || _status == 'stopped'
                        ? TextStyle(fontSize: 30, color: Colors.white)
                        : TextStyle(fontSize: 20, color: Colors.red),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}