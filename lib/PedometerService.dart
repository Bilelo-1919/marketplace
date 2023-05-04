/*import 'package:pedometer/pedometer.dart';

class PedometerService {
  late Stream<StepCount> _stepCountStream;
  int _currentStepCount = 0;

  Stream<StepCount> get stepCountStream => _stepCountStream;
  int get currentStepCount => _currentStepCount;

  void startListening() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(_onData, onError: _onError, onDone: _onDone);
  }

  void _onData(StepCount event) {
    _currentStepCount = event.steps;
  }

  void _onError(error) {
    print('Pedometer error: $error');
  }

  void _onDone() {
    print('Pedometer stopped');
  }
}*/