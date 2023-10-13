import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie_animation/linear_progress%20indicator.dart';

void main() => runApp(const ProgressIndicatorApp());
class ProgressIndicatorApp extends StatelessWidget {
  const ProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProgressIndicatorExample(),
    );
  }
}
class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

  @override
  State<ProgressIndicatorExample> createState() => _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void iniState(){
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Circular progress indicator with a fixed color',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            CircularProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Circular progress indicator',
            ),
          ],
        ),
      ),
    );
  }

}