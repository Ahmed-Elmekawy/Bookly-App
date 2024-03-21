import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.topLeft=Radius.zero,
    this.bottomLeft=Radius.zero,
    this.topRight=Radius.zero,
    this.bottomRight=Radius.zero,
    required this.color,
    required this.onPressed,
    required this.text, required this.width,
  });
  final double width;
  final Radius topLeft;
  final Radius bottomLeft;
  final Radius topRight;
  final Radius bottomRight;
  final Color color;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: topLeft,
              bottomLeft: bottomLeft,
              topRight: topRight,
              bottomRight: bottomRight),
          color: color,
        ),
        child: MaterialButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: Styles.montserratBold16.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            )));
  }
}
