
import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quran_app_android/core/util/widgets/custom_appBar.dart';
import 'package:quran_app_android/core/util/widgets/custom_back_button.dart';
import 'package:quran_app_android/core/util/widgets/my_text.dart';
import 'package:quran_app_android/features/qiblah/presentition/view_model/qiblah_view_model.dart';
import 'package:quran_app_android/features/qiblah/presentition/views/widget/go_settings_view.dart';
import 'package:quran_app_android/features/qiblah/presentition/views/widget/qiblah_stream_builder.dart';

class QiblahView extends StatefulWidget {
  const QiblahView({super.key});

  @override
  State<QiblahView> createState() => _QiblahViewState();
}

class _QiblahViewState extends State<QiblahView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double begin = 0.0;
  Future<Position>? getPosition;

  final QiblahViewModel qiblahViewModel = Get.put(QiblahViewModel());

  @override
  void initState() {
    super.initState();
    qiblahViewModel.requestLocationPermission();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    getPosition = _determinePosition();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QiblahViewModel>(
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(
            loading: const CustomBackButton(),
            title: MyText(
              text: 'القبلة',
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: 'Rubik',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
            ),
            centerTitle: true,
          ),
          body: controller.isDone.value
              ? FutureBuilder<Position>(
                  future: getPosition,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Position positionResult = snapshot.data!;
                      Coordinates coordinates = Coordinates(
                        positionResult.latitude,
                        positionResult.longitude,
                      );
                      double qiblaDirection = Qibla.qibla(coordinates);
                      return QiblahStreamBuilder(
                        animationController: animationController,
                        begin: begin,
                        qiblaDirection: qiblaDirection,
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              : const GoSettingsView(),
        );
      },
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}
