import 'package:dio/src/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_academy_poker/components/widgets.dart';
import 'package:the_academy_poker/data/apis/apis.dart' as api;
import 'package:the_academy_poker/data/apis/register_api.dart';
import 'package:the_academy_poker/data/models/register_model.dart';
import 'package:the_academy_poker/register_screen/register_bloc/register_bloc.dart';
import 'package:the_academy_poker/register_screen/register_bloc/bloc.dart' as registerBloc;
import 'package:the_academy_poker/register_screen/register_bloc/register_state.dart';
import 'package:the_academy_poker/resources/colors.dart';
import 'package:the_academy_poker/resources/images.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:the_academy_poker/utils/constants.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _registerController = RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<RegisterBloc>(
          create: (final context) => RegisterBloc(),
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (final context, final state) async {
              if (state is NavigatedToSignUp) {
                _registerController.success();
                Navigator.of(context).pushReplacementNamed(Constants.signUpRoute);
              }
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(builder: (final context, final state) {
              return buildScreenBackGround(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    height: height,
                    margin: EdgeInsets.symmetric(horizontal: 35.0),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 90.0,
                          ),
                          child: Image.asset(
                            logo,
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.topCenter,
                            scale: 1.0,
                          ),
                        ),
                        Text(
                          'Register'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        SizedBox.fromSize(size: Size.fromHeight(30.0)),
                        TextField(
                          controller: firstNameController,
                          style: textStyle,
                          cursorColor: colorPrimary,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                            ),
                            hintText: 'First name',
                            hintStyle: textStyle,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
                          ),
                        ),
                        SizedBox.fromSize(size: Size.fromHeight(20.0)),
                        TextField(
                          controller: lastNameController,
                          style: textStyle,
                          cursorColor: colorPrimary,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                            ),
                            hintText: 'Last name',
                            hintStyle: textStyle,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
                          ),
                        ),
                        SizedBox.fromSize(size: Size.fromHeight(20.0)),
                        TextField(
                          controller: emailController,
                          style: textStyle,
                          cursorColor: colorPrimary,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: redColor,
                              ),
                            ),
                            hintText: 'Email',
                            hintStyle: textStyle,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
                          ),
                        ),
                        SizedBox.fromSize(size: Size.fromHeight(20.0)),
                        Flexible(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: buildRoundedButton(
                                label: 'Register'.toUpperCase(),
                                controller: _registerController,
                                backColor: redColor,
                                onTap: () {
								  RegisterModel model = RegisterModel(name: firstNameController.value.text,email: emailController.value.text,wm_sid: null);
								  RegisterApi().register(model);
                                  // BlocProvider.of<RegisterBloc>(context)
                                  //     .add(registerBloc.NavigateToSignUp());
                                },
                                textColor: Colors.white,
                                width: width - 40.0,
                                margin: EdgeInsets.only(bottom: 15.0)),
                          ),
                        ),
                        SizedBox.fromSize(size: Size.fromHeight(70.0)),
                      ],
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

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
