import 'package:bloc/bloc.dart';
import 'package:the_academy_poker/presentation/main_screen/main_bloc/main_event.dart';
import 'package:the_academy_poker/presentation/main_screen/main_bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial());

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is JumpToPage) {
      yield JumpedToPage(event.page);
    }
  }
}
