import 'package:equatable/equatable.dart';

abstract class LauncherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NavigateToLogIn extends LauncherEvent {}

class NavigateToRegister extends LauncherEvent {}

class UpdateState extends LauncherEvent {}
