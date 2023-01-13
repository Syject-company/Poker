import 'package:equatable/equatable.dart';

abstract class LauncherState extends Equatable {
  const LauncherState();

  @override
  List<Object> get props => [];
}

class LauncherInitial extends LauncherState {}

class NavigatedToLogIn extends LauncherState {}

class NavigatedToRegister extends LauncherState {}

class StateUpdated extends LauncherState {}
