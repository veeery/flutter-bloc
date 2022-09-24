import 'package:flutter/material.dart';

class CounterPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Counter Page 2'),
      ),

      body: Center(
        child: Column(
          children: [
            // GestureDetector(
            //   onTap: () => context.goNamed(AppPages.counter),
            //   child: Text('Page 1'),
            // ),
            // SizedBox(height: 20),
            // GestureDetector(
            //   onTap: () => context.goNamed(AppPages.counter3),
            //   child: Text('Page 3'),
            // )

          ],
        ),
      ),
    );
  }
}
