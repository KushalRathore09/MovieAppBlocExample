import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

Widget getCommonRichTextWithLink(
    {@required String message,
      @required String linkText,
      @required ThemeData baseTheme,
      GestureTapCallback onLinkTap}) {
  return Container(
    width: double.maxFinite,
    margin: const EdgeInsets.only(top: 20),
    alignment: Alignment.center,
    child: RichText(
      text: TextSpan(
        text: message,
        style: baseTheme.textTheme.subtitle2,
        children: [
          TextSpan(
              text: ' $linkText',
              style: baseTheme.textTheme.subtitle2
                  .copyWith(color: AppColors.PrimaryColor, fontWeight: FontWeight.w500),
              recognizer: TapGestureRecognizer()..onTap = onLinkTap),
        ],
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget getCommonTextLabel({
  @required String labelText,
  @required ThemeData baseTheme,
  String hintText = "",
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  TextEditingController controller,
  Function(String) onSubmitted,
  Function(String) validator,
}) {
  if (validator == null) {
    validator = (value) {
      return null;
    };
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      getCommonLabel(
        baseTheme: baseTheme,
        labelText: labelText,
      ),
      getCommonTextFormField(
        baseTheme: baseTheme,
        hintText: hintText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        controller: controller,
        obscureText: obscureText,
        onSubmitted: onSubmitted,
        validator: validator,
      ),
    ],
  );
}

Widget getCommonTextFormField({
  @required ThemeData baseTheme,
  String hintText = "",
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  EdgeInsetsGeometry contentPadding =
  const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
  TextAlign textAlign = TextAlign.start,
  TextEditingController controller,
  Function(String) onSubmitted,
  Function(String) validator,
}) {
  return TextFormField(
    style: baseTheme.textTheme.bodyText1,
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    textInputAction: textInputAction,
    onFieldSubmitted: onSubmitted,
    validator: validator,
    autovalidate: false,
    autofocus: false,
    textAlign: textAlign,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: AppColors.GrayLite,
      hintStyle: baseTheme.textTheme.subtitle2
          .copyWith(fontSize: 16, fontWeight: FontWeight.w300),
      contentPadding: contentPadding,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: BorderSide(style: BorderStyle.none, width: 0)),
    ),
  );
}

Widget getCommonLabel({
  @required String labelText,
  @required ThemeData baseTheme,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    child: Text(
      labelText,
      style: baseTheme.textTheme.subtitle2,
    ),
  );
}