import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_academy_poker/components/widgets.dart';
import 'package:the_academy_poker/presentation/home_screen/home_bloc/home_bloc.dart';
import 'package:the_academy_poker/presentation/home_screen/home_bloc/home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<HomeBloc>(
          create: (final context) => HomeBloc(),
          child: BlocListener<HomeBloc, HomeState>(
            listener: (final context, final state) async {
              if (state is Navigated) {}
            },
            child: BlocBuilder<HomeBloc, HomeState>(builder: (final context, final state) {
              return buildScreenBackGround(
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      height: height,
                      child: Center(
                        child: Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
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

  @override
  void dispose() {
    super.dispose();
  }
}
