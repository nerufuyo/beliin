import 'package:beliin/common/typography.dart';
import 'package:beliin/presentations/widgets/component.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> customSimpleDialog(BuildContext context,
    {required customDialogAnimation, customDialogText}) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(
              customDialogAnimation,
              width: 100,
              height: 100,
            ),
            customText(
              textValue: customDialogText ?? 'Put your text here',
              customStyle: subHeading1,
            ),
          ],
        ),
      ),
    ),
  );
}
