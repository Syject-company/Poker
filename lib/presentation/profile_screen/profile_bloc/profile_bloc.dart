import 'package:bloc/bloc.dart';
import 'package:the_academy_poker/presentation/profile_screen/profile_bloc/profile_event.dart';
import 'package:the_academy_poker/presentation/profile_screen/profile_bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is PickUpImage) {
      yield ImagePickedUp(event.imageFile);
    } else if (event is LogOut) {
      yield LoggedOut();
    } else if (event is ChangePassword) {
      yield PasswordChanged();
    } else if (event is SaveChanges) {
      yield ChangesSaved();
    }
  }
}
