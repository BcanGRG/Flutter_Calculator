import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HesapButton extends StatelessWidget {
  final String text;
  final Color renk;
  final double textsizee;
  final Color textcoloor;
  final Function tiklaGetir;

  const HesapButton({
    Key key,
    this.text,
    this.renk,
    this.textsizee = 24,
    this.textcoloor,
    this.tiklaGetir,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: FlatButton(
        child: Text(
          text,
          style: GoogleFonts.rubik(
              textStyle: TextStyle(
                  fontSize: textsizee,
                  color: textcoloor == null ? Colors.white : textcoloor)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        color: renk == null ? Color.fromRGBO(22, 37, 35, 1) : renk,
        onPressed: () {
          tiklaGetir(text);
        },
      ),
    );
  }
}
