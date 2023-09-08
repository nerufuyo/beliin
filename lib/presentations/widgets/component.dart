import 'package:beliin/common/pallets.dart';
import 'package:beliin/common/typography.dart';
import 'package:flutter/material.dart';

SizedBox spaceVertical(double height) => SizedBox(height: height);
SizedBox spaceHorizontal(double width) => SizedBox(width: width);

Text customText({required textValue, customStyle, customAlign}) {
  return Text(
    textValue ?? 'Write Something',
    style: customStyle ?? heading1,
    textAlign: customAlign ?? TextAlign.start,
  );
}

InkWell customButton(
  context, {
  required customOnTapEvent,
  customButtonColor,
  customButtonText,
  customButtonTextColor,
}) {
  return InkWell(
    onTap: customOnTapEvent,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: customButtonColor ?? primaryColor100,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Center(
        child: customText(
          textValue: customButtonText ?? 'Button Text',
          customStyle: subHeading1.copyWith(
            color: customButtonTextColor ?? secondaryColor100,
          ),
        ),
      ),
    ),
  );
}

InkWell customButtonWithIcon(
  BuildContext context, {
  required customButtonOnTapEvent,
  customButtonWidth,
  customButtonColor,
  customButtonIcon,
  customButtonIconColor,
  customButtonText,
  customButtonTextColor,
}) {
  return InkWell(
    onTap: customButtonOnTapEvent,
    child: Container(
      width: customButtonWidth ?? MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        color: customButtonColor ?? primaryColor100,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            customButtonIcon ?? Icons.facebook_rounded,
            color: customButtonIconColor ?? secondaryColor100,
          ),
          customText(
            textValue: customButtonText ?? 'Text Button',
            customStyle: subHeading2.copyWith(
              color: customButtonTextColor ?? secondaryColor100,
            ),
          ),
        ],
      ),
    ),
  );
}

Row customDivider(BuildContext context,
    {customLeftWidth, customRightWidth, customTextValue}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: customLeftWidth ?? MediaQuery.of(context).size.width * 0.25,
        height: 1,
        color: Colors.black.withOpacity(.5),
      ),
      customText(
        textValue: customTextValue ?? 'Custom Divider',
        customStyle: subHeading2.copyWith(
          color: Colors.black.withOpacity(.5),
        ),
      ),
      Container(
        width: customRightWidth ?? MediaQuery.of(context).size.width * 0.25,
        height: 1,
        color: Colors.black.withOpacity(.5),
      ),
    ],
  );
}

TextField customTextField({
  required customController,
  customMaxLines,
  customObscureText,
  customKeyboardType,
  customHintText,
  customSuffix,
  customErrorText,
  customOnChanged,
}) {
  return TextField(
    controller: customController,
    maxLines: customMaxLines ?? 1,
    obscureText: customObscureText ?? false,
    keyboardType: customKeyboardType ?? TextInputType.text,
    onChanged: customOnChanged,
    decoration: InputDecoration(
      hintText: customHintText ?? 'Put your text here',
      suffix: customSuffix,
      errorText: customErrorText,
      errorStyle: bodyText1.copyWith(
        color: Colors.red,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: primaryColor100,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(.25),
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
    ),
  );
}
