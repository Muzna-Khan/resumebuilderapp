import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Example"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          type: StepperType.vertical,
          steps: const [
            Step(title: Text("Step 1"), content: Text("This is the first step")),
            Step(title: Text("Step 2"), content: Text("This is the second step")),
            Step(title: Text("Step 3"), content: Text("This is the third step")),
          ],
        ),
      ),
    );
  }
}
