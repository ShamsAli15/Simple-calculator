import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/src.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void Clear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Calculator',
            style: TextStyle(
                color: Color(0xFF311B92),
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        _history,
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(fontSize: 24.0),
                          color: Color(0xFF311B92),
                        ),
                      ),
                    ),
                    alignment: Alignment(1, 1),
                  ),
                ),
                Container(
                  height: 20.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                    //0xFFCB3A28
                    color: Color(0xFFEDE7F6),
                  ),
                ),
                Container(
                  color: Color(0xFFEDE7F6),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          child: Text(
                            _expression,
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(fontSize: 48.0),
                              color: Color(0xFF311B92),
                            ),
                          ),
                          alignment: Alignment(1, 1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Calculator(
                                text: 'AC',
                                fillColor: 0xFFB39DDB,
                                textSize: 20.0,
                                callBack: numClick),
                            Calculator(
                              text: 'C',
                              fillColor: 0xFFB39DDB,
                              callBack: Clear,
                            ),
                            Calculator(
                                text: '%',
                                fillColor: 0xFFD1C4E9,
                                textColor: 0xFF311B92,
                                callBack: numClick),
                            Calculator(
                                text: '/',
                                fillColor: 0xFFD1C4E9,
                                textColor: 0xFF311B92,
                                textSize: 30.0,
                                callBack: numClick),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Calculator(
                                text: '7',
                                fillColor: 0xFF311B92,
                                callBack: numClick),
                            Calculator(
                                text: '8',
                                fillColor: 0xFF311B92,
                                callBack: numClick),
                            Calculator(
                                text: '9',
                                fillColor: 0xFF311B92,
                                callBack: numClick),
                            Calculator(
                                text: '*',
                                fillColor: 0xFFD1C4E9,
                                textColor: 0xFF311B92,
                                textSize: 30.0,
                                callBack: numClick),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Calculator(
                                text: '4',
                                fillColor: 0xFF311B92,
                                callBack: numClick),
                            Calculator(
                                text: '5',
                                fillColor: 0xFF311B92,
                                callBack: numClick),
                            Calculator(
                                text: '6',
                                fillColor: 0xFF311B92,
                                callBack: numClick),
                            Calculator(
                                text: '-',
                                fillColor: 0xFFD1C4E9,
                                textColor: 0xFF311B92,
                                textSize: 30.0,
                                callBack: numClick),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Calculator(
                                text: '1',
                                fillColor: 0xFF311B92,
                                callBack: numClick),
                            Calculator(
                                text: '2',
                                fillColor: 0xFF311B92,
                                callBack: numClick),
                            Calculator(
                                text: '3',
                                fillColor: 0xFF311B92,
                                callBack: numClick),
                            Calculator(
                                text: '+',
                                fillColor: 0xFFD1C4E9,
                                textColor: 0xFF311B92,
                                textSize: 30.0,
                                callBack: numClick),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Calculator(
                                text: '.',
                                fillColor: 0xFF311B92,
                                callBack: numClick),
                            Calculator(
                                text: '0',
                                fillColor: 0xFF311B92,
                                callBack: numClick),
                            Calculator(
                                text: '00',
                                fillColor: 0xFF311B92,
                                textSize: 26.0,
                                callBack: numClick),
                            Calculator(
                                text: '=',
                                fillColor: 0xFFD1C4E9,
                                textColor: 0xFF311B92,
                                textSize: 30.0,
                                callBack: evaluate),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
