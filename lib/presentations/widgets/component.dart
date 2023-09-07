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
