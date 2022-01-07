import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  FontWeight? weight;
  Color? color;
  double? size;
  TextOverflow? overflow;
  int? maxLines;
  final TextAlign? textAlign;

  CustomText({
    required this.text,
    this.weight,
    this.color,
    this.size,
    this.overflow,
    this.maxLines,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: (overflow != null) ? overflow : null,
      maxLines: maxLines ?? null,
      textAlign: textAlign ?? null,
      style: TextStyle(
        fontWeight: weight ?? FontWeight.w500,
        fontSize: size ?? 50,
        color: color ?? Colors.white,
      ),
      softWrap: true,
    );
  }
}
