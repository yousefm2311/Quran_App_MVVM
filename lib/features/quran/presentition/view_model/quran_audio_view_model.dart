// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';

class QuranAudioViewModel extends GetxController {
  QuranAudioViewModel() {
    // getQuranAudio();
  }

  // RxBool isPlay = false.obs;
  // RxBool isLoading = false.obs;

  // final audioPlayer = AudioPlayer();
  // Duration duration = Duration.zero;
  // Duration position = Duration.zero;
  // DetailsViewModel detailsViewModel = Get.put(DetailsViewModel());
  // QuranAudioModel? quranAudioModel;
  // void getQuranAudio() async {
  //   try {
  //     if (detailsViewModel.isOnline.value) {
  //       isLoading.value = true;
  //       Dio_Helper.getData(url: 'quran/ar.alafasy').then((value) {
  //         quranAudioModel = QuranAudioModel.fromJson(value.data);
  //         isLoading.value = false;
  //         update();
  //       });
  //     } else {
  //       isLoading.value = false;
  //       update();
  //     }
  //   } on DioError catch (error) {
  //     if (error.response != null) {
  //       debugPrint(
  //           'DioException [${error.response?.statusCode}]: ${error.response?.data}');
  //     } else if (error.type == DioErrorType.cancel) {
  //       debugPrint('DioException SocketException ');
  //     } else if (error.type == DioErrorType.unknown) {
  //       debugPrint('Connection closed while receiving data');
  //     } else if (error.type == DioErrorType.connectionTimeout ||
  //         error.type == DioErrorType.receiveTimeout) {
  //       debugPrint('Timeout error: $error');
  //     } else {
  //       debugPrint('Dio error: $error');
  //     }
  //     isLoading.value = false;
  //     update();
  //   } on PlatformException {
  //     debugPrint('Error PlatformException');
  //   } catch (e) {
  //     isLoading.value = false;
  //     update();
  //     debugPrint(e.toString());
  //   }
  // }
  // @override
  // void dispose() {
  //   audioPlayer.dispose();
  //   super.dispose();
  // }
  // @override
  // void onInit() {
  //   super.onInit();
  //   audioPlayer.onPlayerStateChanged.listen((state) {
  //     isPlay.value = state == PlayerState.playing;
  //     update();
  //   });
  //   audioPlayer.onDurationChanged.listen((newDuration) {
  //     duration = newDuration;
  //     update();
  //   });
  //   audioPlayer.onPositionChanged.listen((newPosition) {
  //     position = newPosition;
  //     update();
  //   });
  // }
}
