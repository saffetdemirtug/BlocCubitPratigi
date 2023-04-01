import 'package:cubit_bloc/bloc_counter/counter_bloc.dart';
import 'package:cubit_bloc/cubit_counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Cubit & Bloc Kullanımı",
        theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.black.withOpacity(0.8) )
          
        ),
        home: const MyHomePageWithBloc(),
      ),
    );
  }
}

//Cubit kullanımı.
class MyHomePageWithCubit extends StatelessWidget {
  const MyHomePageWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit & Bloc Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 17),
            ),
            BlocBuilder<CounterCubit, CounterCubitState>(
              builder: (BuildContext context, CounterCubitState state) {
                return Text(
                  state.sayac.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.black.withOpacity(0.8),
            onPressed: () {
              context.read<CounterCubit>().arttir();
            },
            tooltip: 'Increment(Arttır)',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            backgroundColor: Colors.black.withOpacity(0.8),
            onPressed: () {
              context.read<CounterCubit>().azalt();
            },
            tooltip: 'Decrement(Azalt)',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

//Bloc kullanımı 
class MyHomePageWithBloc extends StatelessWidget {
  const MyHomePageWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit & Bloc Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 17),
            ),
            BlocBuilder<CounterBloc, CounterBlocState>(
              builder: (BuildContext context, CounterBlocState state) {
                return Text(
                  state.sayac.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.black.withOpacity(0.8),
            onPressed: () {
              context.read<CounterBloc>().add(ArttirEvent());
            },
            tooltip: 'Increment(Arttır)',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            backgroundColor: Colors.black.withOpacity(0.8),
            onPressed: () {
              context.read<CounterBloc>().add(AzaltEvent());
            },
            tooltip: 'Decrement(Azalt)',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
