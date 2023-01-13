import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NavigateToRegister extends LoginEvent {}

class NavigateToForgotPassword extends LoginEvent {}

class LogIn extends LoginEvent {}

class UpdateState extends LoginEvent {}


