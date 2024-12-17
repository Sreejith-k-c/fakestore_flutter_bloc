import 'package:fakestore_flutter_bloc/fakesore_screen/bloc/fakestore_bloc.dart';
import 'package:fakestore_flutter_bloc/fakesore_screen/bloc/fakestore_event.dart';
import 'package:fakestore_flutter_bloc/fakesore_screen/view/fakestore_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (context) => FakestoreBloc()..add(FetchProductsEvents()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FakestoreScreen(),
    );
  }
}
