import 'package:blocflutter/UI/counter/counter_screen.dart';
import 'package:blocflutter/UI/switch_example/switch_example_screen.dart';
import 'package:blocflutter/bloc/counter/counter_bloc.dart';
import 'package:blocflutter/bloc/switch_example/bloc/switch_bloc.dart';
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
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        home: SwitchScreen(),
      ),
    );
  }
}
