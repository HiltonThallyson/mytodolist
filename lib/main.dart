import 'package:flutter/material.dart';

import './screens/main_screen.dart';
import './themes/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO list',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            onPrimary: Colors.black,
            primary: Colors.grey[600],
            alignment: Alignment.center,
            fixedSize: const Size(120, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          )),
          drawerTheme: const DrawerThemeData(backgroundColor: secondaryColor),
          scaffoldBackgroundColor: primaryColor,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor)
              .copyWith(
                  secondary: secondaryColor, tertiary: Colors.blueGrey[900]),
          textTheme: const TextTheme(
              bodyText2: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold))),
      home: MainScreen(),
    );
  }
}
