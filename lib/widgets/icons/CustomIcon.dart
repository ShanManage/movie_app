import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIcon extends StatelessWidget {
  final VoidCallback? callback;
  final IconData icon;
  final double size;
  Color? bgColor, color;
  EdgeInsetsGeometry? padding;

  CustomIcon({
    required this.icon,
    this.callback,
    required this.size,
    this.bgColor,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      child: Container(
        padding: (padding == null) ? EdgeInsets.all(2.5) : padding,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Icon(
          icon,
          color: (color == null) ? Colors.white : color,
          size: size,
        ),
      ),
      onTap: callback ?? null,
    );
  }
}
