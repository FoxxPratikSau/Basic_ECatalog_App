//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

class MyTheme{
   static ThemeData lightTheme(BuildContext context) => ThemeData(
        // primarySwatch: buildMaterialColor(Color(0xFF393551)),
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        // ignore: deprecated_member_use
        accentColor: DarkBluishCOlor,
        
          // ignore: deprecated_member_use
        buttonColor: DarkBluishCOlor,
        
        //primaryTextTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          // ignore: deprecated_member_use
          textTheme: Theme.of(context).textTheme,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            ),

        )
      );

      static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        //brightness: Brightness.dark,
        primarySwatch: buildMaterialColor(Colors.white),
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        // ignore: deprecated_member_use
        accentColor: Colors.white,
        canvasColor: darkcreamColor,
        
        // ignore: deprecated_member_use
        buttonColor: lightBluishCOlor,
        
        //primaryTextTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          // ignore: deprecated_member_use
          textTheme: Theme.of(context).textTheme,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
      )
      )
      );


      //colors
      static Color creamColor= Color(0xfff5f5f5);
      static Color DarkBluishCOlor= Color.fromARGB(255, 57, 53, 81);
      static Color darkcreamColor= Vx.gray900;
      static Color lightBluishCOlor= Vx.indigo500;

     
}