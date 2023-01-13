import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:the_academy_poker/components/widgets.dart';
import 'package:the_academy_poker/presentation/launcher_screen/launcher_bloc/bloc.dart';
import 'package:the_academy_poker/presentation/launcher_screen/launcher_bloc/bloc.dart'
    as launcherBloc;
import 'package:the_academy_poker/resources/colors.dart';
import 'package:the_academy_poker/resources/images.dart';
import 'package:the_academy_poker/utils/constants.dart';
import 'package:video_player/video_player.dart';

class LauncherPage extends StatefulWidget {
  LauncherPage({Key key}) : super(key: key);

  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  ChewieController _chewieController;
  VideoPlayerController _videoPlayerController;
  final _loginController = RoundedLoadingButtonController();
  final _signUpController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<LauncherBloc>(
          create: (final context) => LauncherBloc(),
          child: BlocListener<LauncherBloc, LauncherState>(
            listener: (final context, final state) async {
              if (state is NavigatedToLogIn) {
                _loginController.success();
                BlocProvider.of<LauncherBloc>(context).add(launcherBloc.UpdateState());
                Navigator.of(context).pushNamed(Constants.loginRoute);
              } else if (state is NavigatedToRegister) {
                _signUpController.success();
                BlocProvider.of<LauncherBloc>(context).add(launcherBloc.UpdateState());
                Navigator.of(context).pushNamed(Constants.registerPage);
              }
            },
            child: BlocBuilder<LauncherBloc, LauncherState>(builder: (final context, final state) {
              return buildScreenBackGround(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: height + 100,
                    child: FutureBuilder<bool>(
                      future: _initializePlayer(), // async work
                      builder: (final context, final snapshot) {
                        return snapshot.connectionState == ConnectionState.done && snapshot.hasData
                            ? Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 15.0,
                                      horizontal: 30.0,
                                    ),
                                    child: Image.asset(
                                      logo,
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.topCenter,
                                      scale: 1.0,
                                    ),
                                  ),
                                  (_chewieController != null &&
                                          _chewieController.videoPlayerController.value.initialized)
                                      ? Chewie(
                                          controller: _chewieController,
                                        )
                                      : AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: Center(child: progressBar()),
                                        ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      lessonsContainer(
                                        course: 'Beginner \n Course',
                                        cost: '\$10.99',
                                        lessonsCount: '10 Lessons',
                                        image: coursesBackGround,
                                      ),
                                      lessonsContainer(
                                        course: 'Intermediate \n Course',
                                        cost: '\$25.99',
                                        lessonsCount: '15 Lessons',
                                        image: coursesBackGround,
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Flex(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      direction: Axis.vertical,
                                      children: [
                                        buildRoundedButton(
                                          label: 'Log In',
                                          backColor: colorPrimary,
                                          controller: _loginController,
                                          onTap: () {
                                            BlocProvider.of<LauncherBloc>(context)
                                                .add(launcherBloc.NavigateToLogIn());
                                          },
                                          textColor: Colors.white,
                                          width: width - 40.0,
                                          margin: EdgeInsets.symmetric(vertical: 15.0),
                                        ),
                                        buildRoundedButton(
                                          label: 'Register',
                                          backColor: redColor,
                                          controller: _signUpController,
                                          onTap: () {
                                            BlocProvider.of<LauncherBloc>(context)
                                                .add(launcherBloc.NavigateToRegister());
                                          },
                                          textColor: Colors.white,
                                          width: width - 40.0,
                                          margin: EdgeInsets.only(bottom: 30.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : progressBar(size: 100.0);
                      },
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

  Future<bool> _initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4');
    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
      showControls: false,
    );
    return _videoPlayerController.value.initialized;
  }

  @override
  void dispose() {
    if (_videoPlayerController != null) _videoPlayerController.dispose();
    if (_chewieController != null) _chewieController.dispose();
    super.dispose();
  }
}
