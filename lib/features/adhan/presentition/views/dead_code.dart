// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quran_app/core/view_model/adhan_view_model.dart';
// import 'package:quran_app/res/componenets/custom_appBar.dart';
// import 'package:quran_app/res/componenets/my_text.dart';

// class AdhanView extends GetWidget<AdhanViewModel> {
//   const AdhanView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: MyText(
//           text: 'مواقيت الصلاة ',
//           textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                 fontFamily: 'Rubik',
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           const SizedBox(height: 10.0),
//           GestureDetector(
//             onTap: () {
//               controller.adhan();
//             },
//             child: Container(
//               width: 150,
//               height: 150,
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   const BoxShadow(
//                     color: Colors.black38,
//                     blurRadius: 8,
//                     offset: Offset(4, 4),
//                     spreadRadius: 1,
//                   ),
//                   const BoxShadow(
//                     color: Colors.white70,
//                     blurRadius: 10,
//                     offset: Offset(-4, -4),
//                     spreadRadius: 2,
//                   ),
//                   BoxShadow(
//                       color: Colors.grey.shade300,
//                       blurRadius: 5,
//                       offset: const Offset(.5, 1),
//                       spreadRadius: 3,
//                       blurStyle: BlurStyle.inner),
//                 ],
//                 color: Colors.grey.shade300,
//                 shape: BoxShape.circle,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
// // ignore_for_file: must_be_immutable

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quran_app/core/view_model/adhan_view_model.dart';
// import 'package:quran_app/core/view_model/quran_screen_model.dart';
// import 'package:quran_app/res/componenets/my_text.dart';
// import 'package:quran_app/res/componenets/custom_appBar.dart';
// import 'package:quran_app/util/icon_broken.dart';

// class AdhanView extends StatelessWidget {
//   AdhanView({super.key});
//   AdhanViewModel adhanViewModel = Get.put(AdhanViewModel());
//   QuranScreenViewModel quranScreenViewModel = Get.put(QuranScreenViewModel());

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AdhanViewModel>(
//       init: AdhanViewModel(),
//       builder: (controll) {
//         return Scaffold(
//             appBar: CustomAppBar(
//               title: GestureDetector(
//                 onTap: () {
//                   // DateTime scheduledTime =
//                   //     DateTime.now().add(const Duration(minutes: 1));
//                   // NotifyHelper().displayNotification();
//                   controll.adhan();
//                 },
//                 child: MyText(
//                   text: 'مواقيت الصلاة ',
//                   textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         fontFamily: 'Rubik',
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22,
//                       ),
//                 ),
//               ),
//               centerTitle: true,
//             ),
//             body: controll.adhanModel == null &&
//                     controll.adhanModelShared == null
//                 ? const Center(child: CupertinoActivityIndicator())
//                 : Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Row(
//                           children: [
//                             const Icon(IconBroken.Location),
//                             controll.adhanModel == null &&
//                                     controll.adhanModelShared == null
//                                 ? const Center(
//                                     child: CupertinoActivityIndicator())
//                                 : MyText(
//                                     text:
//                                         '${quranScreenViewModel.isOnline.value ? controll.adhanModel!.data[1].meta!.timezone : controll.adhanModelShared!.data[1].meta!.timezone}',
//                                     textStyle: Theme.of(context)
//                                         .textTheme
//                                         .bodyMedium!
//                                         .copyWith(
//                                           fontFamily: 'Rubik',
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 20,
//                                         ),
//                                   ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                           height: MediaQuery.sizeOf(context).height * 0.13),
//                       Image.asset(
//                         'assets/images/adhan.png',
//                         width: MediaQuery.sizeOf(context).width * 0.9,
//                       ),
//                       const Spacer(),
//                       GetBuilder<AdhanViewModel>(
//                         builder: (cont) {
//                           return controll.adhanModel == null &&
//                                   controll.adhanModelShared == null
//                               ? const Center(
//                                   child: CupertinoActivityIndicator())
//                               : Container(
//                                   width: double.infinity,
//                                   height:
//                                       MediaQuery.sizeOf(context).height * .48,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.white60,
//                                     borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(40),
//                                       topRight: Radius.circular(40),
//                                     ),
//                                   ),
//                                   child: PageView.builder(
//                                     physics: const BouncingScrollPhysics(),
//                                     controller: cont.pageController,
//                                     itemBuilder: (context, index) {
//                                       return _buildListView(
//                                         quranScreenViewModel.isOnline.value
//                                             ? cont.adhanModel!.data[index]
//                                             : cont
//                                                 .adhanModelShared!.data[index],
//                                         context,
//                                         index,
//                                         quranScreenViewModel.isOnline.value
//                                             ? cont.adhanModel!.data[index].date
//                                             : cont.adhanModelShared!.data[index]
//                                                 .date,
//                                       );
//                                     },
//                                     itemCount: quranScreenViewModel
//                                             .isOnline.value
//                                         ? cont.adhanModel!.data.length
//                                         : cont.adhanModelShared!.data.length,
//                                   ),
//                                 );
//                         },
//                       ),
//                     ],
//                   ));
//       },
//     );
//   }

//   _buildListView(model, context, index, model2) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         children: [
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     adhanViewModel.pageController.previousPage(
//                         duration: const Duration(milliseconds: 300),
//                         curve: Curves.easeInOut);
//                   },
//                   icon: const Icon(IconBroken.Arrow___Left)),
//               MyText(
//                 text: '${model2.readable}',
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//               IconButton(
//                   onPressed: () {
//                     adhanViewModel.pageController.nextPage(
//                         duration: const Duration(milliseconds: 300),
//                         curve: Curves.easeInOut);
//                   },
//                   icon: const Icon(IconBroken.Arrow___Right)),
//             ],
//           ),
//           const SizedBox(height: 30),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               MyText(
//                 text: adhanViewModel.convertTo12HourFormat(
//                     model.timings.fajr.replaceAll("(EEST)", "")),
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//               MyText(
//                 text: 'Fajr',
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//               MyText(
//                 text: 'الفجر',
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               MyText(
//                 text: adhanViewModel.convertTo12HourFormat(
//                     model.timings.dhuhr.replaceAll("(EEST)", "")),
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//               MyText(
//                 text: 'Dhuhr',
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//               MyText(
//                 text: 'الظهر',
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               MyText(
//                 text: adhanViewModel.convertTo12HourFormat(
//                     model.timings.asr.replaceAll("(EEST)", "")),
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//               MyText(
//                 text: 'Asr',
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//               MyText(
//                 text: 'العصر',
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               MyText(
//                 text: adhanViewModel.convertTo12HourFormat(
//                     model.timings.maghrib.replaceAll("(EEST)", "")),
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//               MyText(
//                 text: 'Maghrib',
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//               MyText(
//                 text: 'المغرب',
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               MyText(
//                 text: adhanViewModel.convertTo12HourFormat(
//                     model.timings.isha.replaceAll("(EEST)", "")),
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//               MyText(
//                 text: 'Isha',
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//               MyText(
//                 text: 'العشاء',
//                 textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontFamily: 'Rubik',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
