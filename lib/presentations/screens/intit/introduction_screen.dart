import 'package:beliin/common/constant.dart';
import 'package:beliin/common/pallets.dart';
import 'package:beliin/common/typography.dart';
import 'package:beliin/presentations/screens/authentication_screen.dart';
import 'package:beliin/presentations/widgets/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});
  static const routeName = '/introduction-screen';

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          itemCount: 3,
          itemBuilder: (context, pageIndex) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: pageIndex != 2
                        ? InkWell(
                            onTap: () => pageController.animateToPage(
                              pageIndex = 2,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            ),
                            child: customText(
                              textValue: 'Lewati',
                              customStyle: subHeading2.copyWith(
                                color: primaryColor100,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        pageIndex == 0
                            ? 'lib/assets/images/intro1.svg'
                            : pageIndex == 1
                                ? 'lib/assets/images/intro2.svg'
                                : 'lib/assets/images/intro3.svg',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                      spaceVertical(40),
                      customText(
                        textValue:
                            introductionContent[pageIndex]['title'].toString(),
                        customStyle: heading2,
                        customAlign: TextAlign.center,
                      ),
                      spaceVertical(20),
                      customText(
                        textValue: introductionContent[pageIndex]['description']
                            .toString(),
                        customStyle: subHeading2,
                        customAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  customButton(
                    context,
                    customButtonText: pageIndex == 2 ? 'Mulai' : 'Lanjut',
                    customOnTapEvent: () {
                      if (pageIndex == 2) {
                        Navigator.pushNamed(
                          context,
                          AuthenticationScreen.routeName,
                        );
                      } else {
                        pageController.animateToPage(
                          pageIndex + 1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
