import 'package:beliin/common/pallets.dart';
import 'package:beliin/common/typography.dart';
import 'package:beliin/presentations/screens/intit/introduction_screen.dart';
import 'package:beliin/presentations/widgets/component.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.pushNamed(context, IntroductionScreen.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor100,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText(
              textValue: 'Beliin.',
              customStyle: heading1.copyWith(
                color: secondaryColor100,
                fontSize: 62,
              ),
            ),
            customText(
              textValue: 'Belanja lebih mudah, murah, dan cepat',
              customStyle: subHeading2.copyWith(color: secondaryColor100),
            ),
          ],
        ),
      ),
    );
  }
}
