import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

AppBar myCartAppBar({final String? title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      style: Styles.gTSectra30.copyWith(fontSize: 25),
    ),
  );
}