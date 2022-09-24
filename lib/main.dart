import 'package:flutter/material.dart';
import 'package:flutter_veeery_bloc/example/pages/app_routes.dart';
import 'package:flutter_veeery_bloc/example/pages/example_pages/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BloC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppRoutes.routes,
      home: CounterPage(),
    );
  }
}
