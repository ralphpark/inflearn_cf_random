
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
            const TestWidget(label: 'Text 1'),
            const TestWidget(label: 'Text 2'),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('Build')
            ),
          ],
        ),
      ),
    );
  }
}
class TestWidget extends StatelessWidget {
  const TestWidget({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    print('$label 빌드 실행');
    return Container(
      child: Text(label),
    );
  }
}
