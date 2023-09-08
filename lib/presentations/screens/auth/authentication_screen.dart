import 'package:beliin/common/pallets.dart';
import 'package:beliin/common/typography.dart';
import 'package:beliin/data/repository/repository.dart';
import 'package:beliin/presentations/screens/home_screen.dart';
import 'package:beliin/presentations/widgets/component.dart';
import 'package:beliin/presentations/widgets/dialog.dart';
import 'package:beliin/utils/authentication.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});
  static const routeName = '/authentication-screen';

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with SingleTickerProviderStateMixin {
  final PageController pageController = PageController(initialPage: 0);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  TabController? tabController;

  String? emailErrorText;
  String? passwordErrorText;
  bool isPasswordShowed = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, pageIndex) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0,
                  child: customText(
                    textValue: 'Beliin.',
                    customStyle: heading1.copyWith(
                      color: primaryColor100,
                      fontSize: 62,
                    ),
                  ),
                ),
                if (pageIndex == 0) loginScreen(context, pageIndex),
                if (pageIndex == 1)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        TabBar(
                          controller: tabController,
                          indicatorColor: primaryColor100,
                          labelColor: primaryColor100,
                          unselectedLabelColor: Colors.black.withOpacity(.5),
                          labelStyle: subHeading3,
                          unselectedLabelStyle: subHeading3,
                          tabs: const [
                            Tab(text: 'Telepon'),
                            Tab(text: 'Email'),
                          ],
                        ),
                        spaceVertical(24),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  customTextField(
                                    customController: phoneController,
                                    customHintText: 'Nomor Telepon',
                                    customKeyboardType: TextInputType.phone,
                                  ),
                                  spaceVertical(16),
                                  customText(
                                    textValue:
                                        'Kamu mungkin mendapatkan notifikasi SMS dari kami untuk verifikasi akun kamudan persyaratan masuk.',
                                    customStyle: bodyText2,
                                    customAlign: TextAlign.center,
                                  ),
                                  spaceVertical(16),
                                  customButton(
                                    context,
                                    customOnTapEvent: () {},
                                    customButtonText: 'Selanjutnya',
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  customTextField(
                                    customController: phoneController,
                                    customHintText: 'Alamat Email',
                                    customKeyboardType:
                                        TextInputType.emailAddress,
                                  ),
                                  spaceVertical(16),
                                  customButton(
                                    context,
                                    customOnTapEvent: () {},
                                    customButtonText: 'Selanjutnya',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Padding loginScreen(BuildContext context, int pageIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customButtonWithIcon(
            context,
            customButtonOnTapEvent: () {},
            customButtonWidth: MediaQuery.of(context).size.width,
            customButtonIcon: FontAwesomeIcons.google,
            customButtonText: 'Masuk dengan Google',
          ),
          spaceVertical(24),
          customDivider(context, customTextValue: 'or'),
          spaceVertical(24),
          customTextField(
            customController: emailController,
            customHintText: 'Alamat Email',
            customKeyboardType: TextInputType.emailAddress,
            customErrorText: emailErrorText,
            customSuffix: emailErrorText != null
                ? const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 16,
                  )
                : null,
          ),
          spaceVertical(16),
          customTextField(
            customController: passwordController,
            customHintText: 'Kata Sandi',
            customKeyboardType: TextInputType.visiblePassword,
            customObscureText: !isPasswordShowed,
            customErrorText: passwordErrorText,
            customSuffix: passwordErrorText != null
                ? const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 16,
                  )
                : GestureDetector(
                    onTap: () => setState(
                      () => isPasswordShowed = !isPasswordShowed,
                    ),
                    child: customText(
                      textValue: isPasswordShowed ? 'Hide' : 'Show',
                      customStyle: subHeading3.copyWith(
                        color: primaryColor100,
                      ),
                    ),
                  ),
          ),
          spaceVertical(16),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {},
              child: customText(
                textValue: 'Kamu lupa password?',
                customStyle: subHeading3.copyWith(
                  color: primaryColor100,
                ),
              ),
            ),
          ),
          spaceVertical(24),
          customButton(
            context,
            customOnTapEvent: () {
              if (pageIndex == 0) {
                if (emailController.text.isEmpty) {
                  setState(
                      () => emailErrorText = 'Alamat email tidak boleh kosong');
                } else if (passwordController.text.isEmpty) {
                  setState(() =>
                      passwordErrorText = 'Kata sandi tidak boleh kosong');
                } else if (passwordController.text.length < 8) {
                  setState(() =>
                      passwordErrorText = 'Kata sandi minimal 8 karakter');
                } else {
                  Future.delayed(
                    const Duration(seconds: 3),
                    () => loginFunction(
                      context,
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  ).then((value) => setState(() {
                        emailController.clear();
                        passwordController.clear();
                      }));

                  customSimpleDialog(
                    context,
                    customDialogAnimation:
                        'lib/assets/lotties/lottieSuccess.json',
                    customDialogText: 'Login berhasil',
                  );
                }
              }
            },
            customButtonText: 'Masuk',
          ),
          spaceVertical(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customText(
                textValue: 'Belum punya akun?',
                customStyle: bodyText2,
              ),
              spaceHorizontal(8),
              InkWell(
                onTap: () => pageController
                    .animateToPage(
                      1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    )
                    .then((value) => setState(() {
                          emailController.clear();
                          passwordController.clear();
                          emailErrorText = null;
                          passwordErrorText = null;
                        })),
                child: customText(
                  textValue: 'Daftar sekarang',
                  customStyle: subHeading3.copyWith(
                    color: primaryColor100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
