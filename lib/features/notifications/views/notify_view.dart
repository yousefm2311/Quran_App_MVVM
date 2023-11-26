// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/core/util/assets.dart';

class NotifyView extends StatefulWidget {
  const NotifyView({super.key, this.payload});

  final String? payload;

  @override
  State<NotifyView> createState() => _NotifyViewState();
}

class _NotifyViewState extends State<NotifyView> {
  String _payload = '';

  @override
  void initState() {
    super.initState();
    _payload = widget.payload!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Lottie.asset(AssetsData.coming),
      ),
    );
  }
}
