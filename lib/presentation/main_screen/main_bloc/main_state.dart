import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class JumpedToPage extends MainState {
  JumpedToPage(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}
