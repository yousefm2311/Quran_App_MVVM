import 'package:get/get.dart';
import 'package:quran_app/core/service/database/database_helper.dart';
import 'package:quran_app/features/nameOfAllah/presentition/view_model/Names_Of_Allah_view_model.dart';
import 'package:quran_app/features/adhan/presentition/view_model/adhan_view_model.dart';
import 'package:quran_app/features/azkar/presenition/view_model/azkar_view_model.dart';
import 'package:quran_app/features/settings/presentition/view_model/settins_view_model.dart';
import 'package:quran_app/features/tafsser/presentition/view_model.dart/tafseer_details_view_model.dart';
import 'package:quran_app/features/hadith/presentition/view_model/hadith_view_model.dart';
import 'package:quran_app/features/home/presentition/view_model/home_view_model.dart';
import 'package:quran_app/features/onboarding/presentition/view_model/onboarding_view_model.dart';
import 'package:quran_app/features/pngtree/presentition/view_model/pngTree_view_model.dart';
import 'package:quran_app/features/quran/presentition/view_model/quran_audio_view_model.dart';
import 'package:quran_app/features/quran/presentition/view_model/quran_screen_model_details.dart';
import 'package:quran_app/features/quran/presentition/view_model/quran_view_model.dart';
import 'package:quran_app/core/service/database/local_storage_data.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuranScreenViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => QuranViewModel());
    Get.lazyPut(() => TafseerDetailsViewModel());
    Get.lazyPut(() => QuranAudioViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => LocalStorageAdhanData());
    Get.lazyPut(() => PngTreeViewModel());
    Get.lazyPut(() => AzkarViewModel());
    Get.lazyPut(() => NamesOfAllahViewModel());
    Get.lazyPut(() => HadithViewModel());
    Get.lazyPut(() => AdhanViewModel());
    Get.lazyPut(() => OnBoardingViewModel());
    Get.lazyPut(() => SettingsViewModel());
  }
}
