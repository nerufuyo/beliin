import 'package:beliin/common/pallets.dart';
import 'package:beliin/common/typography.dart';
import 'package:beliin/presentations/widgets/component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});
  static const routeName = '/authentication-screen';

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: PageView.builder(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, pageIndex) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customText(
                      textValue: 'Beliin.',
                      customStyle: heading1.copyWith(
                        color: primaryColor100,
                        fontSize: 62,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 62),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customButtonWithIcon(
                            context,
                            customButtonOnTapEvent: () {},
                            customButtonIcon: FontAwesomeIcons.google,
                            customButtonText: 'Login with Google',
                          ),
                          spaceVertical(16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                height: 1,
                                color: Colors.black.withOpacity(.4),
                              ),
                              spaceHorizontal(8),
                              customText(
                                textValue: 'OR',
                                customStyle: bodyText1.copyWith(
                                  color: Colors.black.withOpacity(.4),
                                ),
                              ),
                              spaceHorizontal(8),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                height: 1,
                                color: Colors.black.withOpacity(.4),
                              ),
                            ],
                          ),
                          spaceVertical(16),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
