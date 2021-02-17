import 'package:calculatorapp/widgets/HesapButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(HesapApp());

class HesapApp extends StatefulWidget {
  @override
  _HesapAppState createState() => _HesapAppState();
}

class _HesapAppState extends State<HesapApp> {
  void numTiklama(String text) {
    setState(() {
      _ifade += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _ifade = " ";
      _gecmis = " ";
    });
  }

  void clear(String text) {
    setState(() {
      String veri = _ifade;
      _ifade = "";
      for (var i = 0; i < veri.length - 1; i++) {
        _ifade += veri[i].toString();
      }
    });
  }

  void sonuc(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_ifade);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      if (text == "=") {
        _gecmis = _ifade;
        _ifade = eval.toString();
      } else {
        numTiklama(text);
      }
    });
  }

  String _gecmis = " ";
  String _ifade = " ";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hesap Makinesii',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
          backgroundColor: Color.fromRGBO(22, 37, 35, 1),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _gecmis,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Color.fromRGBO(104, 105, 99, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    _ifade,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(fontSize: 48, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              satirMetodu2("AC", "<-", "%", "/"),
              satirMetodu("7", "8", "9", "*", numTiklama),
              satirMetodu("4", "5", "6", "-", numTiklama),
              satirMetodu("1", "2", "3", "+", numTiklama),
              satirMetodu(".", "0", "00", "=", sonuc),
            ],
          )),
    );
  }

  Widget satirMetodu(
      String one, String two, String three, String four, Function fonk) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HesapButton(
            text: one,
            tiklaGetir: fonk,
          ),
          HesapButton(
            text: two,
            tiklaGetir: fonk,
          ),
          HesapButton(
            text: three,
            tiklaGetir: fonk,
          ),
          HesapButton(
            text: four,
            renk: Color.fromRGBO(238, 235, 208, 1),
            textcoloor: Color.fromRGBO(177, 15, 46, 1),
            tiklaGetir: fonk,
            textsizee: 33.0,
          ),
        ],
      ),
    );
  }

  Widget satirMetodu2(String one, String two, String three, String four) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HesapButton(
            text: one,
            renk: Color.fromRGBO(104, 105, 99, 1),
            tiklaGetir: allClear,
          ),
          HesapButton(
            text: two,
            renk: Color.fromRGBO(104, 105, 99, 1),
            tiklaGetir: clear,
          ),
          HesapButton(
            text: three,
            renk: Color.fromRGBO(238, 235, 208, 1),
            textcoloor: Color.fromRGBO(177, 15, 46, 1),
            tiklaGetir: numTiklama,
            textsizee: 33.0,
          ),
          HesapButton(
            text: four,
            renk: Color.fromRGBO(238, 235, 208, 1),
            textcoloor: Color.fromRGBO(177, 15, 46, 1),
            tiklaGetir: numTiklama,
            textsizee: 33.0,
          ),
        ],
      ),
    );
  }
}

// Color.fromRGBO(238, 235, 208, 1),
