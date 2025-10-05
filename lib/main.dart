import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/create_account_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids Guard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kFontLexend,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFCED7E3)),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const LoginScreen(),
        '/signup': (_) => const SignUpScreen(),
        '/create': (_) => const CreateAccountScreen(),
      },
    );
  }
}
