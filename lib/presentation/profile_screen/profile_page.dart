import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:the_academy_poker/components/widgets.dart';
import 'package:the_academy_poker/presentation/profile_screen/profile_bloc/profile_bloc.dart';
import 'package:the_academy_poker/presentation/profile_screen/profile_bloc/profile_state.dart';
import 'package:the_academy_poker/resources/colors.dart';
import 'package:the_academy_poker/utils/constants.dart';
import 'package:the_academy_poker/presentation/profile_screen/profile_bloc/bloc.dart'
    as profileBloc;
import 'package:the_academy_poker/utils/enums.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _imageFile;
  final ImagePicker _picker = ImagePicker();

  final _changePassController = RoundedLoadingButtonController();
  final _saveChangesController = RoundedLoadingButtonController();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<ProfileBloc>(
          create: (final context) => ProfileBloc(),
          child: BlocListener<ProfileBloc, ProfileState>(
            listener: (final context, final state) async {
              if (state is ImagePickedUp) {
                _imageFile = state.imageFile;
              } else if (state is LoggedOut) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Constants.loginRoute, (route) => false);
              } else if (state is PasswordChanged) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Constants.resetPasswordRoute, (route) => false,
                    arguments: {'fromScreen': ClassType.Profile});
              } else if (state is ChangesSaved) {}
            },
            child: BlocBuilder<ProfileBloc, ProfileState>(builder: (final context, final state) {
              return buildScreenBackGround(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: height,
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 50.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.logout),
                                    color: Colors.white,
                                    iconSize: 35.0,
                                    onPressed: () {
                                      BlocProvider.of<ProfileBloc>(context)
                                          .add(profileBloc.LogOut());
                                    },
                                  )
                                ],
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: height * 0.38,
                                  margin: const EdgeInsets.symmetric(vertical: 40.0),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF2EA487),
                                        Color(0xFF1E7661),
                                      ],
                                      stops: [0.0, 0.8],
                                      transform: GradientRotation(1.2),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 12,
                                        offset: Offset(0, 6),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Column(
                                      children: [
                                        SizedBox(height: height * 0.1),
                                        inputTextFieldRounded(
                                          controller: _nameController,
                                          hintText: 'Name',
                                        ),
                                        SizedBox(height: 10.0),
                                        inputTextFieldRounded(
                                          controller: _lastNameController,
                                          hintText: 'Last name',
                                        ),
                                        SizedBox(height: 10.0),
                                        inputTextFieldRounded(
                                          controller: _countryController,
                                          hintText: 'Country',
                                        ),
                                        SizedBox(height: 10.0),
                                      ],
                                    ),
                                  ),
                                ),
                                Transform(
                                  transform:
                                      Matrix4.translationValues(0, -((height * 0.38) / 2), 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _pickImage(context: context);
                                    },
                                    child: Container(
                                      width: width * 0.28,
                                      height: width * 0.28,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 5),
                                              blurRadius: 8,
                                              color: Colors.black45)
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: colorPrimary,
                                        backgroundImage: _imageFile == null
                                            ? AssetImage('assets/photo-camera.png')
                                            : FileImage(_imageFile),
                                        //	: NetworkImage(imageLink),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Flex(
                                mainAxisAlignment: MainAxisAlignment.center,
                                direction: Axis.vertical,
                                children: [
                                  buildRoundedButton(
                                    label: 'Change password',
                                    backColor: colorPrimary,
                                    controller: _changePassController,
                                    onTap: () {
                                      BlocProvider.of<ProfileBloc>(context)
                                          .add(profileBloc.ChangePassword());
                                    },
                                    textColor: Colors.white,
                                    width: width - 40.0,
                                    margin: EdgeInsets.symmetric(vertical: 15.0),
                                  ),
                                  buildRoundedButton(
                                    label: 'Save changes',
                                    backColor: redColor,
                                    controller: _saveChangesController,
                                    onTap: () {},
                                    textColor: Colors.white,
                                    width: width - 40.0,
                                    margin: EdgeInsets.only(bottom: 15.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  void _pickImage({@required BuildContext context}) async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    BlocProvider.of<ProfileBloc>(context).add(profileBloc.PickUpImage(File(pickedFile.path)));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _countryController.dispose();
    super.dispose();
  }
}
