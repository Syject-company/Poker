import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class NavigatedToLogin extends SignupState {}

