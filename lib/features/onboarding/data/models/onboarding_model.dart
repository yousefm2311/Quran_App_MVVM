
import 'package:quran_app_android/core/util/assets.dart';

class OnBoardingModel {
  String? image, title, description;

  OnBoardingModel({this.image, this.title, this.description});
}

List<OnBoardingModel> onboardingData = [
  OnBoardingModel(
    title: ' أهلا بك في تطبيق تقرّب ويمكنك استخدام التطبيق بدون انترنت',
    description:
        'يمكنك قراءة القرآن الكريم والحديث والاذكار بآبسط الطرق والتعامل مع التطبيق بسهوله ',
    image: AssetsData.json_5,
  ),
  OnBoardingModel(
    title: 'تفسير وتوضيح ما تيسر من القرآن ',
    description:
        ' تفسير آيات القرآن الكريم كاملة ويوجد ترتيب الاحادث وجميع الاذكار يمكنك حفظ الآيات والصفحات والرجوع اليها في اي وقت',
    image: AssetsData.json_4,
  ),
  OnBoardingModel(
    title: 'اتجاه القبله ومواقيت الصلاه واستخدام السبحة الالكترونية',
    description:
        'تحديد اتجاه القبله بدقه عاليه وسهوله ومواقيت الصلاه والسبحه الالكترونيه',
    image: AssetsData.location,
  ),
  OnBoardingModel(
    title: 'الاشعارات وارسال الاذكار ',
    description: 'ارسال الاشعارات والتحكم في وقت ارسال الاذكار ',
    image: AssetsData.notification,
  ),
];
