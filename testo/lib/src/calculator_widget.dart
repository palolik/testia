import 'package:flutter/material.dart';
import 'calculator.dart';

class CalculatorWidget extends StatelessWidget {
  const CalculatorWidget({super.key, required int input});

  @override
  Widget build(BuildContext context) {
    final calculator = Calculator();
    final result = calculator.addOne(5); // Just show result of 5 + 1

    return Center(
      child: Text(
        'Result: $result',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
