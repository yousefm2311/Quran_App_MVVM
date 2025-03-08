import 'package:get/get.dart';
import 'package:quran_app/core/middleware/middleware.dart';
import 'package:quran_app/core/util/constant/constant.dart';
import 'package:quran_app/core/util/binding.dart';
import 'package:quran_app/features/adhan/presentition/views/adhan_view.dart';
import 'package:quran_app/features/azkar/presenition/views/azkar_view.dart';
import 'package:quran_app/features/nameOfAllah/presentition/views/name_of_allah_view.dart';
import 'package:quran_app/features/azkar/presenition/views/azkar_details_view.dart';
import 'package:quran_app/features/settings/presentition/views/settings_view.dart';
import 'package:quran_app/features/tafsser/presentition/views/tafseer_details_view.dart';
import 'package:quran_app/features/hadith/presentition/views/hadith_details_view.dart';
import 'package:quran_app/features/home/presentition/views/home_view.dart';
import 'package:quran_app/features/notifications/views/notify_view.dart';
import 'package:quran_app/features/onboarding/presentition/views/onboarding_screen.dart';
import 'package:quran_app/features/pngtree/presentition/views/pngTreeView.dart';
import 'package:quran_app/features/qiblah/presentition/views/qiblah_view.dart';
import 'package:quran_app/features/quran/presentition/views/quran_details_view.dart';
import 'package:quran_app/features/quran/presentition/views/quran_view.dart';
import 'package:quran_app/features/tafsser/presentition/views/tafseer_view.dart';
import 'package:quran_app/features/hadith/presentition/views/hadith__view.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomeView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: tafsser,
      bindings: [Binding()],
      page: () => TafseerView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: hadith,
      bindings: [Binding()],
      page: () => HadithView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: quranScreen,
      // bindings: [Binding()],
      page: () => QuranScreen(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: nameofAllah,
      // bindings: [Binding()],
      page: () => const NameOfAllahView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: detailsTafseer,
      page: () => const TafseerDetailsView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: pngTree,
      page: () => PngTreeView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: azkar,
      page: () => AzkarView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: azkarDetails,
      page: () => DetailesAzkarView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: adhan,
      page: () =>  AdhanView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: notify,
      page: () => const NotifyView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: qiblah,
      page: () => const QiblahView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: detailsScreen,
      page: () => DetailsScreen(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: onboarding,
      page: () => OnBoardingScreen(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
      middlewares: [AuthMiddleWare()],
    ),
    GetPage(
      name: sectionHadith,
      page: () => const SectionHadithView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
    GetPage(
      name: settings,
      page: () =>  const SettingsView(),
      transition: Transition.cupertino,
      transitionDuration: kTransitionDuration,
    ),
  ];

  static String home = '/home';
  static String settings = '/settings';
  static String tafsser = '/tafsser';
  static String hadith = '/hadith';
  static String nameofAllah = '/nameofAllah';
  static String detailsTafseer = '/detailsTafseer';
  static String pngTree = '/pngTree';
  static String azkar = '/azkar';
  static String azkarDetails = '/azkarDetails';
  static String adhan = '/adhan';
  static String notify = '/notify';
  static String qiblah = '/qiblah';
  static String quranScreen = '/quranScreen';
  static String detailsScreen = '/detailsScreen';
  static String onboarding = '/onboarding';
  static String sectionHadith = '/sectionHadith';
}
