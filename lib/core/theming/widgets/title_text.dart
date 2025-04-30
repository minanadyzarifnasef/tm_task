import 'package:flutter/material.dart';

import '../../constants/string_constants.dart';
import '../managers/color_manager.dart';



class TitleText extends StatelessWidget {
  const TitleText(
      {required this.text,
      this.align,
      this.color,
      this.fontSize,
      this.fontFamily,
      super.key});

  final String text;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? fontColor,
          fontWeight: FontWeight.w700,
          fontSize: fontSize ?? 24,
          fontFamily: fontFamily ?? fontName,
        ),
      textAlign: align ?? TextAlign.center,
    );
  }
}
