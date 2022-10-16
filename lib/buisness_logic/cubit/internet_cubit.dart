import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/enums.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;
  InternetCubit() : super(InternetState.loading) {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (event) {
        if (event == ConnectivityResult.wifi) {
          connectedToWifi();
        } else if (event == ConnectivityResult.mobile) {
          connectedToMobileData();
        } else {
          disconnected();
        }
      },
    );
  }
  void connectedToWifi() {
    emit(InternetState.connectedToWifi);
  }

  void connectedToMobileData() {
    emit(InternetState.connectedToMobileData);
  }

  void disconnected() {
    emit(InternetState.disconnected);
  }
}
