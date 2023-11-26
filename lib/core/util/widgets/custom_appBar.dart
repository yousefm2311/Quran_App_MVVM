// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    required this.title,
    this.loading,
    this.action,
    this.color,
    this.centerTitle = false,
  });

  final Widget title;
  Widget? loading;
  List<Widget>? action;
  bool centerTitle;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      title: title,
      leading: loading,
      centerTitle: centerTitle,
      actions: action,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
