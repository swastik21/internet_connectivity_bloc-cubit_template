import 'package:flutter/material.dart';
import 'package:internet_connectivity/buisness_logic/bloc/internet_bloc.dart';
import 'package:internet_connectivity/buisness_logic/cubit/internet_cubit.dart';

import 'Presentation/screen/home.dart';
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
        BlocProvider<InternetBloc>(create: ((context) => InternetBloc())),
        BlocProvider<InternetCubit>(create: (context) => InternetCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const HomePage(),
      ),
    );
  }
}
