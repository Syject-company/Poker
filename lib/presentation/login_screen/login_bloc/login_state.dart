import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class NavigatedToRegister extends LoginState {}

class NavigatedToForgotPassword extends LoginState {}

class LoggedIn extends LoginState {}

class StateUpdated extends LoginState {}

