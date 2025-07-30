import 'package:flutter/material.dart';

import '../core/app_export.dart';
import '../theme/text_style_helper.dart';

/**
 * CustomTextButton - A reusable text button component with customizable styling
 * 
 * @param text - The text to display on the button
 * @param onPressed - Callback function when button is pressed
 * @param textColor - Color of the button text
 * @param fontSize - Font size of the button text
 * @param fontWeight - Font weight of the button text
 * @param fontFamily - Font family of the button text
 */
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
  }) : super(key: key);

  /// The text to display on the button
  final String text;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Color of the button text
  final Color? textColor;

  /// Font size of the button text
  final double? fontSize;

  /// Font weight of the button text
  final FontWeight? fontWeight;

  /// Font family of the button text
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: TextStyleHelper.instance.textStyle9
            .copyWith(color: textColor ?? Color(0xFF584CF4)),
      ),
    );
  }
}
