import 'package:bloc/bloc.dart';
import 'package:flutter_veeery_bloc/example/api_repository.dart';
import 'package:flutter_veeery_bloc/example/blocks/home/home_event.dart';
import 'package:flutter_veeery_bloc/example/blocks/home/home_state.dart';
import 'package:flutter_veeery_bloc/example/model/user.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final Api api;

  HomeBloc(this.api) : super(Initial());

  @override
  Stream<HomeState> mapEventToState(HomeState event) async* {
    if (event is GetAll) {
      yield* getAllUsers();
    }
  }

  Stream<HomeState> getAllUsers() async* {
    try {
      yield Loading();
      List<User> users = await api.fetchUsers();
      yield UserLoaded(users);
    } catch (e) {
      print(e);
      yield ShowMessage(e.toString());
    }
  }

}