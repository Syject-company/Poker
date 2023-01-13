import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PickUpImage extends ProfileEvent {
  PickUpImage(this.imageFile);

  final imageFile;

  @override
  List<Object> get props => [this.imageFile];
}

class LogOut extends ProfileEvent {}

class ChangePassword extends ProfileEvent {}

class SaveChanges extends ProfileEvent {}
