import 'package:ecommerce_app/home_screen.dart';
import 'package:ecommerce_app/main_screen.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: 'Poppins',
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(5),
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(5),
              ),
            ),
          ),
        ),
      ),
      // darkTheme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: darkColorScheme,
      //   fontFamily: 'Inter',
      //   filledButtonTheme: FilledButtonThemeData(
      //     style: ButtonStyle(
      //       shape: WidgetStatePropertyAll(
      //         RoundedRectangleBorder(
      //           borderRadius: BorderRadiusGeometry.circular(5),
      //         ),
      //       ),
      //     ),
      //   ),
      //   outlinedButtonTheme: OutlinedButtonThemeData(
      //     style: ButtonStyle(
      //       shape: WidgetStatePropertyAll(
      //         RoundedRectangleBorder(
      //           borderRadius: BorderRadiusGeometry.circular(5),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      home: MainScreen(),
    );
  }
}
