import 'package:bloc/bloc.dart';
import 'package:the_academy_poker/presentation/home_screen/home_bloc/home_event.dart';
import 'package:the_academy_poker/presentation/home_screen/home_bloc/home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is Navigate) {
      yield Navigated();
    } /*else if (event is NavigateToSignUp) {
      yield NavigatedToSignUp();
    }*/
  }
}
