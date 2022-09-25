import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_veeery_bloc/example/api_repository.dart';
import 'package:flutter_veeery_bloc/example/blocks/home/home_bloc.dart';
import 'package:flutter_veeery_bloc/example/blocks/home/home_event.dart';
import 'package:flutter_veeery_bloc/example/blocks/home/home_state.dart';
import 'package:flutter_veeery_bloc/example/model/user.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> users = [];
  late HomeBloc bloc;

  @override
  void initState() {
    bloc = HomeBloc(Api());
    // bloc.add(GetAll());
    super.initState();
  }

  void fetchUsers() {
    bloc.add(GetAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Testing'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('asc'),
        onPressed: () async {
          await bloc.api.fetchUsers();
        },
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: bloc,
        listener: (context, state) {
          // Listener tidak butuh return sebuah widget
          // Cocok untuk menampilkan Message, Toast, SnackBar, Dialog, etc
          if (state is ShowMessage) {
          } else if (state is UserLoaded) {
            users.clear();
            users.addAll(state.users);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              // createUserList(),
              Text("${users.length}"),
              isLoading(state)
            ],
          );
        },
      ),
    );
  }

  Widget createUserList() {
    if (!users.isNotEmpty) {
      return ListView.builder(
        physics: const ScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) {

          User user = users[index];

          return Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(8),
            child: Text(users.length.toString()),
          );
        },
      );
    }
    return const Center(
      child: Text("Kosong"),
    );
  }

  Widget isLoading(state) {
    if (state is Loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container();
  }
}
