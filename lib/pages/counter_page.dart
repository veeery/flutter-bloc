import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_veeery_bloc/blocks/counter.dart';

class CounterPage extends StatelessWidget {

  CounterBloc bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    print('test');
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Counter Page"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        bloc.decrease();
                      },
                      icon: const Icon(Icons.remove)),
                  IconButton(
                      onPressed: () {
                        // bloc.inputController.add('add');
                        bloc.increment();
                      },
                      icon: const Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
      )
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
                print(state);
                if (state == 4) {
                  bloc.counter = 10;
                  bloc.sink.add(bloc.counter);

                  bloc.emit(state=10);

                };
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
