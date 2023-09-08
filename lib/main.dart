import 'package:beliin/presentations/screens/auth/authentication_screen.dart';
import 'package:beliin/presentations/screens/home_screen.dart';
import 'package:beliin/presentations/screens/intit/introduction_screen.dart';
import 'package:beliin/presentations/screens/intit/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beliin App',
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          // Initial Screen
          case SplashScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            );
          case IntroductionScreen.routeName:
            return PageRouteBuilder(
              transitionsBuilder: (context, animation, _, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(2, 5),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              pageBuilder: (context, animation, _) {
                return const IntroductionScreen();
              },
            );

          // Authentication Screen
          case AuthenticationScreen.routeName:
            return PageRouteBuilder(
              transitionsBuilder: (context, animation, _, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(2, 5),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              pageBuilder: (context, animation, _) {
                return const AuthenticationScreen();
              },
            );

          case HomeScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const Text('Page Not Found'),
            );
        }
      },
    );
  }
}
