import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_academy_poker/components/widgets.dart';
import 'package:the_academy_poker/presentation/login_screen/login_bloc/bloc.dart' as logInBloc;
import 'package:the_academy_poker/presentation/login_screen/login_bloc/login_bloc.dart';
import 'package:the_academy_poker/presentation/login_screen/login_bloc/login_state.dart';
import 'package:the_academy_poker/resources/colors.dart';
import 'package:the_academy_poker/resources/images.dart';
import 'package:the_academy_poker/utils/constants.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:the_academy_poker/utils/enums.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginController = RoundedLoadingButtonController();

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
        body: BlocProvider<LoginBloc>(
          create: (final context) => LoginBloc(),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (final context, final state) async {
              if (state is NavigatedToRegister) {
                BlocProvider.of<LoginBloc>(context).add(logInBloc.UpdateState());
                Navigator.of(context).pushNamed(Constants.registerPage);
              } else if (state is NavigatedToForgotPassword) {
                BlocProvider.of<LoginBloc>(context).add(logInBloc.UpdateState());
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Constants.resetPasswordRoute, (route) => false,
                    arguments: {'fromScreen': ClassType.LogIn});
              } else if (state is LoggedIn) {
                _loginController.success();
                BlocProvider.of<LoginBloc>(context).add(logInBloc.UpdateState());
                //TODO: implement login api
                Navigator.of(context).pushNamedAndRemoveUntil(Constants.mainPage, (route) => false);
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(builder: (final context, final state) {
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
                          'LOG IN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                        SizedBox.fromSize(size: Size.fromHeight(30.0)),
                        TextField(
                          controller: _emailController,
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
                        TextField(
                          controller: _passwordController,
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
                            hintText: 'Password',
                            hintStyle: textStyle,
                            contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
                          ),
                        ),
                        SizedBox.fromSize(size: Size.fromHeight(30.0)),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<LoginBloc>(context)
                                .add(logInBloc.NavigateToForgotPassword());
                          },
                          child: Text(
                            'I forgot my password',
                            style: textStyle,
                          ),
                        ),
                        SizedBox.fromSize(size: Size.fromHeight(20.0)),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<LoginBloc>(context).add(logInBloc.NavigateToRegister());
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'New? ',
                                style: textStyle,
                              ),
                              TextSpan(
                                  text: 'Register',
                                  style: TextStyle(
                                      color: lightGreenColor, fontWeight: FontWeight.bold)),
                            ]),
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: buildRoundedButton(
                              label: 'Log in'.toUpperCase(),
                              backColor: redColor,
                              controller: _loginController,
                              onTap: () {
                                BlocProvider.of<LoginBloc>(context).add(logInBloc.LogIn());
                              },
                              textColor: Colors.white,
                              width: width - 40.0,
                              margin: EdgeInsets.only(bottom: 15.0),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(size: Size.fromHeight(50.0)),
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
    super.dispose();
  }
}
