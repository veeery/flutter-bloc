import 'package:flutter_veeery_bloc/example/pages/home/home_view.dart';

class AppPages {
  static const String home = "/home";
}

class AppRoutes {
  static final routes = {

    AppPages.home : (context) => Home(),

  };
}
