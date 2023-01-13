import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ImagePickedUp extends ProfileState {
  ImagePickedUp(this.imageFile);

  final imageFile;

  @override
  List<Object> get props => [this.imageFile];
}

class LoggedOut extends ProfileState {}

class PasswordChanged extends ProfileState {}

class ChangesSaved extends ProfileState {}
