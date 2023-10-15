import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

Container customButton(
    {required String text,
    required void Function()? onPressed,
    Color color = Colors.white,
    Radius topLeft = Radius.zero,
    Radius topRight = Radius.zero,
    Radius bottomLeft = Radius.zero,
    Radius bottomRight = Radius.zero}) {
  return Container(
      height: 48,
      width: 150,
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
