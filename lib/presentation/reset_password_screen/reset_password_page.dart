import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:the_academy_poker/components/widgets.dart';
import 'package:the_academy_poker/presentation/reset_password_screen/reset_password_bloc/bloc.dart'
    as resetPassBloc;
import 'package:the_academy_poker/presentation/reset_password_screen/reset_password_bloc/reset_password_bloc.dart';
import 'package:the_academy_poker/presentation/reset_password_screen/reset_password_bloc/reset_password_state.dart';
import 'package:the_academy_poker/resources/colors.dart';
import 'package:the_academy_poker/resources/images.dart';
import 'package:the_academy_poker/utils/constants.dart';
import 'package:the_academy_poker/utils/enums.dart';

class ResetPasswordPage extends StatefulWidget {
  ResetPasswordPage({Key key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _resetPassController = RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<ResetPasswordBloc>(
          create: (final context) => ResetPasswordBloc(),
          child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
            listener: (final context, final state) async {
              if (state is NavigatedToLogin) {
                _resetPassController.success();
                Navigator.of(context).pushReplacementNamed(Constants.loginRoute);
              }
            },
            child: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                builder: (final context, final state) {
              return buildScreenBackGround(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: height,
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
                            arguments != null && arguments['fromScreen'] == ClassType.Profile
                                ? 'CHANGE PASSWORD'
                                : 'FORGOT PASSWORD',
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
                          Flexible(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: buildRoundedButton(
                                  label: arguments != null &&
                                          arguments['fromScreen'] == ClassType.Profile
                                      ? 'CHANGE PASSWORD'
                                      : 'RESET PASSWORD',
                                  controller: _resetPassController,
                                  backColor: redColor,
                                  onTap: () {
                                    BlocProvider.of<ResetPasswordBloc>(context)
                                        .add(resetPassBloc.NavigateToLogin());
                                  },
                                  textColor: Colors.white,
                                  width: width - 40.0,
                                  margin: EdgeInsets.only(bottom: 35.0)),
                            ),
                          ),
                          SizedBox.fromSize(size: Size.fromHeight(50.0)),
                        ],
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

  @override
  void dispose() {
    super.dispose();
  }
}
