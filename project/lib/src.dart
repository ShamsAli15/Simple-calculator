import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double textSize;
  final Function callBack;
  const Calculator({
    Key? key,
    required this.text,
    required this.fillColor,
    this.textColor = 0xFFFFFFFFFF,
    required this.callBack,
    this.textSize = 28.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 65.0,
        height: 65.0,
        child: FlatButton(
          onPressed: () {
            callBack(text);
          },
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(fontSize: textSize),
            ),
          ),
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        ),
      ),
    );
  }
}
