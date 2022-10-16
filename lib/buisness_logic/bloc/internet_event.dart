part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}

class InternetConnectedToWifi extends InternetEvent {}

class InternetConnectedToMobileData extends InternetEvent {}

class InternetDisconnected extends InternetEvent {}
