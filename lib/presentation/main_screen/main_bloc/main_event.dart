import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class JumpToPage extends MainEvent {
  JumpToPage(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}
