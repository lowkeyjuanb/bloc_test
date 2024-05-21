import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[900],
            title: const Center(
                child: Text(
              'BLOC TEST',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            )),
          ),
          backgroundColor: Colors.white,
          body: BlocProvider(
            create: (context) => CounterBloc(),
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(state.count.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 50))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton.small(
                          onPressed: () {
                            // Add your onPressed code here!
                            context.read<CounterBloc>().add(CountDecrement());
                          },
                          child: const Icon(Icons.remove),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        FloatingActionButton.small(
                          onPressed: () {
                            context.read<CounterBloc>().add(CountIncrement());
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
