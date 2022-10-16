import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/buisness_logic/bloc/bloc/internet_bloc.dart';
import 'package:internet_connectivity/buisness_logic/cubit/cubit/internet_cubit.dart';
import 'package:internet_connectivity/constants/enums.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Bloc:"),
            BlocBuilder<InternetBloc, InternetState>(
              builder: (context, state) {
                if (state == InternetState.loading) {
                  return const Text("loading");
                } else if (state == InternetState.connectedToWifi) {
                  return const Text("Connected to Wifi");
                } else if (state == InternetState.connectedToMobileData) {
                  return const Text("Connected to Mobile Data");
                } else {
                  return const Text("Disconnected");
                }
              },
            ),
            const Text("cubit:"),
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state == InternetState.loading) {
                  return const Text("loading");
                } else if (state == InternetState.connectedToWifi) {
                  return const Text("Connected to Wifi");
                } else if (state == InternetState.connectedToMobileData) {
                  return const Text("Connected to Mobile Data");
                } else {
                  return const Text("Disconnected");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
