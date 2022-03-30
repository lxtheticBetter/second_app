import 'package:flutter/material.dart';
import 'package:second_app/pages/cart_screen.dart';
import 'package:second_app/pages/home_screen.dart';
import 'package:second_app/pages/login_screen.dart';
import 'package:second_app/utils/routes.dart';
import 'package:second_app/utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme: CustomTheme.lightTheme(context),
      darkTheme: CustomTheme.darkTheme(context),
      initialRoute: Routes.homeScreenRoute,
      routes: {
        Routes.homeScreenRoute: (context) => const HomeScreen(),
        Routes.loginRoute: (context) => const LoginScreen(),
        Routes.cartRoute: (context) => const CartScreen(),
      },
    );
  }
}
