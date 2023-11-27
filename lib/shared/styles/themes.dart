import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'colors.dart';


ThemeData darkTheme = ThemeData(
  primarySwatch: defaultColor,

  scaffoldBackgroundColor: HexColor('333739'),

  appBarTheme:  AppBarTheme(
      titleSpacing: 20,
      //backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
       statusBarColor: HexColor('333739'),
        statusBarIconBrightness:Brightness.light,
      ),
     backgroundColor: HexColor('333739'),
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      )
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
   backgroundColor: HexColor('333739'),

  ),

);

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('#F5F5F5'),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: defaultColor
  ),
  appBarTheme:  const AppBarTheme(
      titleSpacing: 20,
      //backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white12,
        statusBarIconBrightness:Brightness.dark,
      ),
      backgroundColor: Colors.white12,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
      iconTheme: IconThemeData(
          color: Colors.black
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20,
    backgroundColor: Colors.white,

  ),

) ;