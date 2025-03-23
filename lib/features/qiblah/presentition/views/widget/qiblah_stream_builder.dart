import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:quran_app_android/core/util/assets.dart';

class QiblahStreamBuilder extends StatefulWidget {
  final AnimationController animationController;
  final double begin;
  final double qiblaDirection;

  const QiblahStreamBuilder({
    super.key,
    required this.animationController,
    required this.begin,
    required this.qiblaDirection,
  });

  @override
  State<QiblahStreamBuilder> createState() => _QiblahStreamBuilderState();
}

class _QiblahStreamBuilderState extends State<QiblahStreamBuilder> {
  late Animation<double> animation;
  double begin = 0.0;

  @override
  void initState() {
    super.initState();
    animation =
        Tween(begin: begin, end: begin).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CupertinoActivityIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final compassEvent = snapshot.data;
        if (compassEvent == null) {
          return const Center(child: Text('Unable to fetch Qiblah direction'));
        }

        // حساب اتجاه القبلة بالنسبة للشمال المغناطيسي
        double heading =
            compassEvent.heading! * (pi / 180); // تمت إزالة الضرب في -1
        double qiblaAngle = widget.qiblaDirection * (pi / 180);

        // تحديث الرسوم المتحركة
        animation = Tween(
          begin: begin,
          end: qiblaAngle - heading,
        ).animate(widget.animationController);

        begin = qiblaAngle - heading;
        widget.animationController.forward(from: 0);

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${compassEvent.heading!.toInt()}°',
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
                  animation: animation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: animation.value,
                      child: Image.asset(AssetsData.qiblahImage),
                    );
                  },
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
// class QiblahStreamBuilder extends StatefulWidget {
//   final AnimationController animationController;
//   final double begin;
//   final double qiblaDirection;

//   const QiblahStreamBuilder({
//     super.key,
//     required this.animationController,
//     required this.begin,
//     required this.qiblaDirection,
//   });

//   @override
//   State<QiblahStreamBuilder> createState() => _QiblahStreamBuilderState();
// }

// class _QiblahStreamBuilderState extends State<QiblahStreamBuilder> {
//   late Animation<double> animation;
//   double begin = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     animation =
//         Tween(begin: begin, end: begin).animate(widget.animationController);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FlutterCompass.events,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CupertinoActivityIndicator());
//         }

//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }

//         final compassEvent = snapshot.data;
//         if (compassEvent == null) {
//           return const Center(child: Text('Unable to fetch Qiblah direction'));
//         }

//         // Update the Tween value
//         animation = Tween(
//           begin: begin,
//           end: (compassEvent.heading! * (pi / 180) ),
//         ).animate(widget.animationController);

//         begin = (compassEvent.heading! * (pi / 180) );
//         widget.animationController.forward(from: 0);

//         return Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 '${compassEvent.heading!.toInt()}°',
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                     ),
//               ),
//               SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
//               SizedBox(
//                 height: 300,
//                 child: AnimatedBuilder(
//                   animation: animation,
//                   builder: (context, child) {
//                     debugPrint('Animation Value: ${animation.value}');
//                     return Transform.rotate(
//                       angle: animation.value,
//                       child: Image.asset(AssetsData.qiblahImage),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
