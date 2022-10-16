import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

import '../../../constants/enums.dart';

part 'internet_event.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

  InternetBloc() : super(InternetState.loading) {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (event) {
        if (event == ConnectivityResult.wifi) {
          add(InternetConnectedToWifi());
        } else if (event == ConnectivityResult.mobile) {
          add(InternetConnectedToMobileData());
        } else {
          add(InternetDisconnected());
        }
      },
    );
    on<InternetConnectedToMobileData>(
        (event, emit) => emit(InternetState.connectedToMobileData));
    on<InternetConnectedToWifi>(
        (event, emit) => emit(InternetState.connectedToWifi));
    on<InternetDisconnected>((event, emit) => emit(InternetState.disconnected));
  }

  @override
  Future<void> close() {
    _connectivitySubscription!.cancel();
    return super.close();
  }
}
