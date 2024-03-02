import 'package:flutter/material.dart';
import 'package:vs_story_designer/vs_story_designer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Story Designer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VSStoryDesigner(
                  centerText: "Start Your Design",
                  onDone: (uri) {
                    debugPrint(uri);
                  },
                ),
              ),
            );
          },
          child: const Text('Open Story Designer'),
        ),
      ),
    );
  }
}
