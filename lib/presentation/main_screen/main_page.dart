import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_academy_poker/components/widgets.dart';
import 'package:the_academy_poker/presentation/home_screen/home_page.dart';
import 'package:the_academy_poker/presentation/main_screen/main_bloc/bloc.dart' as mainBloc;
import 'package:the_academy_poker/presentation/main_screen/main_bloc/main_bloc.dart';
import 'package:the_academy_poker/presentation/main_screen/main_bloc/main_state.dart';
import 'package:the_academy_poker/presentation/profile_screen/profile_page.dart';
import 'package:the_academy_poker/presentation/settings_screen/settings_page.dart';
import 'package:the_academy_poker/resources/colors.dart';
import 'package:the_academy_poker/resources/images.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController;
  List<Widget> pages = <Widget>[
    ProfilePage(),
    HomePage(),
    SettingsPage(),
  ];
  var _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<MainBloc>(
          create: (final context) => MainBloc(),
          child: BlocListener<MainBloc, MainState>(
            listener: (final context, final state) async {
              if (state is JumpedToPage) {
                _pageController.animateToPage(state.page,
                    duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
                _currentIndex = state.page;
              }
            },
            child: BlocBuilder<MainBloc, MainState>(builder: (final context, final state) {
              return buildScreenBackGround(
                child: Stack(
                  children: [
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        child: SizedBox(
                          height: height,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: pages.length,
                            physics: NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            itemBuilder: (final context, final itemIndex) {
                              return pages[itemIndex];
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: buildNavigationBar(context: context),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget buildNavigationBar({@required BuildContext context}) {
    return Container(
      height: kBottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Image.asset(
              profileIcon,
              fit: BoxFit.scaleDown,
              scale: 1.3,
              color: _currentIndex == 0 ? iconBackColor : grayColor,
            ),
            tooltip: 'Profile',
            onPressed: () {
              BlocProvider.of<MainBloc>(context).add(mainBloc.JumpToPage(0));
            },
          ),
          IconButton(
            icon: Image.asset(
              homeIcon,
              fit: BoxFit.scaleDown,
              scale: 1.3,
              color: _currentIndex == 1 ? iconBackColor : grayColor,
            ),
            tooltip: 'Home',
            onPressed: () {
              BlocProvider.of<MainBloc>(context).add(mainBloc.JumpToPage(1));
            },
          ),
          IconButton(
            icon: Image.asset(
              settingsIcon,
              fit: BoxFit.scaleDown,
              scale: 1.3,
              color: _currentIndex == 2 ? iconBackColor : grayColor,
            ),
            tooltip: 'Settings',
            onPressed: () {
              BlocProvider.of<MainBloc>(context).add(mainBloc.JumpToPage(2));
            },
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
