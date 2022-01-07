import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormFeild extends StatelessWidget {
  String hintText;
  TextEditingController fieldController;
  IconData? prefixIcon;
  Color? fillColor;
  VoidCallback? callback;
  double? radius;

  CustomFormFeild({
    required this.hintText,
    required this.fieldController,
    this.prefixIcon,
    this.fillColor,
    this.callback,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: this.fieldController,
        keyboardType: TextInputType.text,
        onFieldSubmitted: (text) {
          this.callback!();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius:
                BorderRadius.all(Radius.circular(this.radius ?? 50.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius:
                BorderRadius.all(Radius.circular(this.radius ?? 50.0)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius:
                BorderRadius.all(Radius.circular(this.radius ?? 50.0)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius:
                BorderRadius.all(Radius.circular(this.radius ?? 50.0)),
          ),
          prefixIcon: (this.prefixIcon != null) ? Icon(this.prefixIcon) : null,
          hintText: this.hintText,
          filled: true,
          fillColor: (this.fillColor == null) ? Colors.white : this.fillColor,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
