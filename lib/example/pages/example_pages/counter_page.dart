import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_veeery_bloc/example/blocks/counter.dart';
import 'package:flutter_veeery_bloc/example/pages/app_routes.dart';

class CounterPage extends StatelessWidget {

  CounterBloc bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Counter Page"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_arrow_right),
        onPressed: () {
          Navigator.pushNamed(context, AppPages.counter2);
        },
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildStreamBuilder(),
              const SizedBox(height: 20),
              buildBlocBuilder(),
              const SizedBox(height: 20),
              buildBlocListener(),
              const SizedBox(height: 20),
              buildBlocConsumer(),


            ],
          ),
        ),
      )
    );
  }

  Widget buildBlocConsumer() {
    //Tidak Ada buildWhen tidak masalah
    //BlocConsumer = Gabungan antara BlocBuilder & BlocListener
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      width: 200,
      height: 100,
      child: Center(
        child: BlocConsumer<CounterBloc, int>(
          bloc: bloc,
          buildWhen: (previous, current) {
            if (current==10) {
              return false;
            } else {
              return true;
            }
          },
          builder:((context, state) {
            return Text('ini Bloc Consumer = $state');
          }),
          listener: (context, state) {
            return print("$state");
          },
          // listenWhen: (context, state) {
          //   if (state == 10) {
          //     return true;
          //   } else {
          //     return false;
          //   }
          // },
        ),
      ),
    );
  }

  Widget buildBlocListener() {
    return Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text('BlocListener'),
            BlocListener(
              bloc: bloc,
              listener: (context, state) {
                print("Sudah");
              },
              listenWhen: (previous, current) {
                if (current == 20) {
                  print("INI");
                  return true;
                } else {
                  return false;
                }
              },
              child: buildBlocBuilder()
            ),
          ],
        ));
  }

  Widget buildStreamBuilder() {
    return Container(
        width: 200,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text('StreamBuilder'),
            StreamBuilder(
                stream: bloc.builderStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Text('Tunggu');
                  } else {
                    return Text('Angka Saat ini: ${snapshot.data}');
                  }
                }),
          ],
        ));
  }

  Widget buildBlocBuilder() {
    return Container(
        width: 200,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text('BlocBuilder'),
            BlocBuilder(
              bloc: bloc,
              builder: (context, state) {
                return Text('$state');
              },
            )
          ],
        ));
  }

}
