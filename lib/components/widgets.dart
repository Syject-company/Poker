import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:the_academy_poker/resources/colors.dart';

Widget buildAppBar(
  BuildContext context,
  String label, {
  bool backButton = true,
  double letterSpacing = 0.0,
}) {
  return AppBar(
    leading: backButton
        ? IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        : Container(),
    title: Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: letterSpacing,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

Widget buildScreenBackGround({Widget child}) {
  return ColoredBox(
    color: colorPrimary,
    child: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/background.png',
          fit: BoxFit.cover,
        ),
        child,
      ],
    ),
  );
}

Widget buildRoundedButton(
    {@required String label,
    @required VoidCallback onTap,
    @required Color backColor,
    @required Color textColor,
    @required EdgeInsets margin,
    @required double width,
    @required RoundedLoadingButtonController controller,
    BoxDecoration decoration}) {
  return Container(
    height: 45.0,
    width: width,
    margin: margin,
    child: RoundedLoadingButton(
      width: width,
      controller: controller,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 17,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      onPressed: onTap,
      color: backColor,
      borderRadius: 15.0,
    ),
    decoration: decoration,
  );
}

Widget progressBar({double size}) {
  return Container(
    height: size,
    width: size,
    child: Center(
      child: CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff1E7661)),
      ),
    ),
  );
}

Widget lessonsContainer(
    {@required String course,
    @required String cost,
    @required String lessonsCount,
    @required String image}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Column(
      children: [
        Stack(
          children: [
            SizedBox(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                scale: 1.1,
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      course,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
                    decoration: BoxDecoration(
                      color: Color(0xffB92C2E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      cost,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            lessonsCount,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    ),
    decoration: BoxDecoration(
        color: Color(0xff1E7661), borderRadius: BorderRadius.all(Radius.circular(17))),
  );
}

TextStyle get textStyle => TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );

Widget inputTextFieldRounded(
    {@required TextEditingController controller, @required String hintText}) {
  return TextField(
    controller: controller,
    style: textStyle,
    cursorColor: Colors.red,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(left: 25.0),
      alignLabelWithHint: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Colors.white24,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Colors.white24,
        ),
      ),
      fillColor: Colors.white24,
      filled: true,
      hintText: hintText,
      hintStyle: textStyle,
    ),
  );
}

Widget inputTextField({@required TextEditingController controller, @required String hintText}) {
  return TextField(
    controller: controller,
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
      hintText: hintText,
      hintStyle: textStyle,
      contentPadding: EdgeInsets.symmetric(horizontal: 25.0),
    ),
  );
}
