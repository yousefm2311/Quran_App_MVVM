import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:quran_app/core/util/assets.dart';
import 'package:quran_app/features/qiblah/presentition/views/qiblah_view.dart';

class QiblahStreamBuilder extends StatelessWidget {
  const QiblahStreamBuilder({super.key});



  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CupertinoActivityIndicator());
        }
        final qiblahDirection = snapshot.data;
        animation = Tween(
                begin: begin, end: (qiblahDirection!.qiblah * (pi / 180) * -1))
            .animate(animationController!);
        begin = (qiblahDirection.qiblah * (pi / 180) * -1);
        animationController!.forward(from: 0);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${qiblahDirection.direction.toInt()} °',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: 'Rubik',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
              SizedBox(
                height: 300,
                child: AnimatedBuilder(
                  animation: animation!,
                  builder: (context, child) => Transform.rotate(
                    angle: animation!.value,
                    child: Image.asset(AssetsData.qiblahImage),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
            ],
          ),
        );
      },
    );
  }
}
