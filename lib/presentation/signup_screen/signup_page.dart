import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_academy_poker/components/widgets.dart';
import 'package:the_academy_poker/presentation/signup_screen/signup_bloc/signup_bloc.dart';
import 'package:the_academy_poker/presentation/signup_screen/signup_bloc/signup_state.dart';
import 'package:the_academy_poker/resources/colors.dart';
import 'package:the_academy_poker/resources/images.dart';
import 'package:the_academy_poker/presentation/signup_screen/signup_bloc/bloc.dart' as signupBloc;
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:the_academy_poker/utils/constants.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final phoneController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final zipController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final birthDayController = TextEditingController();
  final currencyController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _signUpController = RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<SignupBloc>(
          create: (final context) => SignupBloc(),
          child: BlocListener<SignupBloc, SignupState>(
            listener: (final context, final state) async {
              if (state is NavigatedToLogin) {
                _signUpController.success();
                Navigator.of(context).pushReplacementNamed(Constants.loginRoute);
              }
            },
            child: BlocBuilder<SignupBloc, SignupState>(builder: (final context, final state) {
              return buildScreenBackGround(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        inputFields(),
                        Flexible(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: buildRoundedButton(
                                label: 'sign up'.toUpperCase(),
                                controller: _signUpController,
                                backColor: redColor,
                                onTap: () {
                                  BlocProvider.of<SignupBloc>(context)
                                      .add(signupBloc.NavigateToLogin());
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

  Widget inputFields() {
    return Flex(
      direction: Axis.vertical,
      children: [
        SizedBox.fromSize(size: Size.fromHeight(30.0)),
        inputTextField(
          controller: phoneController,
          hintText: 'Phone number',
        ),
        SizedBox.fromSize(size: Size.fromHeight(30.0)),
        inputTextField(
          controller: firstNameController,
          hintText: 'First name',
        ),
        SizedBox.fromSize(size: Size.fromHeight(30.0)),
        inputTextField(
          controller: lastNameController,
          hintText: 'Last name',
        ),
        SizedBox.fromSize(size: Size.fromHeight(30.0)),
        inputTextField(
          controller: zipController,
          hintText: 'ZIP',
        ),
        SizedBox.fromSize(size: Size.fromHeight(30.0)),
        inputTextField(
          controller: countryController,
          hintText: 'Country',
        ),
        SizedBox.fromSize(size: Size.fromHeight(30.0)),
        inputTextField(
          controller: cityController,
          hintText: 'City',
        ),
        SizedBox.fromSize(size: Size.fromHeight(30.0)),
        inputTextField(
          controller: birthDayController,
          hintText: 'Date of birthday',
        ),
        SizedBox.fromSize(size: Size.fromHeight(30.0)),
        inputTextField(
          controller: currencyController,
          hintText: 'Currency',
        ),
        SizedBox.fromSize(size: Size.fromHeight(30.0)),
        inputTextField(
          controller: addressController,
          hintText: 'Address',
        ),
        SizedBox.fromSize(size: Size.fromHeight(30.0)),
        inputTextField(
          controller: emailController,
          hintText: 'Email',
        ),
        SizedBox.fromSize(size: Size.fromHeight(30.0)),
        inputTextField(
          controller: passwordController,
          hintText: 'Password',
        ),
        SizedBox.fromSize(size: Size.fromHeight(50.0)),
      ],
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    countryController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
