import 'package:flutter/material.dart';

class CounterPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Counter Page 3'),
      ),

      body: Column(
        children: [
          // GestureDetector(
          //   onTap: () => context.goNamed(AppPages.counter2),
          //   child: Text('Page 2'),
          // ),
          // SizedBox(height: 20),
          // GestureDetector(
          //   onTap: () => context.goNamed("${AppPages.counter4}"),
          //   child: Text('Page 4'),
          // )
        ],
      ),
    );
  }
}
