import 'dart:math';

import 'package:animation_container/bloc/animation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'AnimationBloc'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final animBloc = AnimationBloc();
  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<AnimationBloc, AnimationState>(
          bloc: animBloc,
          builder: (context, state) {
            if (state is AnimationInitial) {
              return AnimatedContainer(
                alignment: Alignment.center,
                child: const Text("❤️"),
                duration: const Duration(seconds: 1),
                height: state.height.toDouble(),
                width: state.width.toDouble(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(state.radius.toDouble()),
                  color: state.color,
                ),
              );
            }
            return const Text('Что то пошло не так');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          animBloc.add(ChangeEvent());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.restart_alt_outlined, color: Colors.black),
      ),
    );
  }
}
