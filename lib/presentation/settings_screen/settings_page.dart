import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_academy_poker/components/widgets.dart';
import 'package:the_academy_poker/presentation/settings_screen/settings_bloc/settings_bloc.dart';
import 'package:the_academy_poker/presentation/settings_screen/settings_bloc/settings_state.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<SettingsBloc>(
          create: (final context) => SettingsBloc(),
          child: BlocListener<SettingsBloc, SettingsState>(
            listener: (final context, final state) async {
              if (state is Navigated) {}
            },
            child: BlocBuilder<SettingsBloc, SettingsState>(builder: (final context, final state) {
              return buildScreenBackGround(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: height,
                    child: Center(
                      child: Text(
                        'Settings',
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
