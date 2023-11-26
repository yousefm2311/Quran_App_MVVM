// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  MyText({super.key, required this.text, this.textStyle, this.maxLines});

  final String text;
  var textStyle;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
