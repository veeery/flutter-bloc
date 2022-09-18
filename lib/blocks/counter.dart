import 'dart:async';

import 'package:bloc/bloc.dart';

class CounterBloc extends Cubit<int>{
  CounterBloc({this.counter = 1}) : super(counter);

  int counter = 0;

  StreamController controller = StreamController();
  StreamSink get sink => controller.sink;
  Stream get builderStream => controller.stream;

  void increment() {
    counter++;
    sink.add(counter);
    emit(state+1);
  }

  void decrease() {
    counter--;
    sink.add(counter);
    emit(state-1);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }

}