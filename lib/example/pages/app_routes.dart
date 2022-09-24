import 'package:flutter_veeery_bloc/example/pages/example_pages/counter_page.dart';
import 'package:flutter_veeery_bloc/example/pages/example_pages/counter_page_2.dart';
import 'package:flutter_veeery_bloc/example/pages/example_pages/counter_page_3.dart';

class AppPages {
  static const String counter = "/counter";
  static const String counter2 = "/counter2";
  static const String counter3 = "/counter3";
}

class AppRoutes {
  static final routes = {

    AppPages.counter : (context) => CounterPage(),
    AppPages.counter2 : (context) => CounterPage2(),
    AppPages.counter3 : (context) => CounterPage3()

  };
}
