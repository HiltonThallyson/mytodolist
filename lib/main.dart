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
          drawerTheme: const DrawerThemeData(backgroundColor: secondaryColor),
          scaffoldBackgroundColor: primaryColor,
          iconTheme: const IconThemeData()
              .copyWith(color: Colors.white, size: 25, opacity: 1),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor)
              .copyWith(
                  secondary: secondaryColor, tertiary: Colors.blueGrey[900]),
          textTheme: const TextTheme().copyWith(
              headline5: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
              bodyText2: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold))),
      home: MainScreen(),
    );
  }
}
