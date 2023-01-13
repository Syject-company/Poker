import 'package:bloc/bloc.dart';
import 'package:the_academy_poker/register_screen/register_bloc/register_event.dart';
import 'package:the_academy_poker/register_screen/register_bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is NavigateToSignUp) {
      yield NavigatedToSignUp();
    }
  }
}
