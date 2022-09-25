import 'package:equatable/equatable.dart';
import 'package:flutter_veeery_bloc/example/model/user.dart';

abstract class HomeState extends Equatable {}

class Initial implements HomeState {

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;

}

class Loading implements HomeState {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => false;

}

class UserLoaded implements HomeState {

  final List<User> users;

  const UserLoaded(this.users);

  @override
  List<Object> get props => [users];

  @override
  bool? get stringify => false;

}

class ShowMessage implements HomeState {

  final String message;

  const ShowMessage(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => false;
}