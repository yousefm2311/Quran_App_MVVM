import 'package:flutter/cupertino.dart';
import 'package:quran_app_android/features/nameOfAllah/presentition/view_model/Names_Of_Allah_view_model.dart';
import 'package:quran_app_android/features/nameOfAllah/presentition/views/widgets/name_of_allah_list_view_items.dart';

class NameOfAllahListView extends StatelessWidget {
  const NameOfAllahListView({super.key, required this.contoller});
  final NamesOfAllahViewModel contoller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
      child: contoller.isLoading.value
          ? const Center(child: CupertinoActivityIndicator())
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  NameOfAllahListViewItems(model: contoller.nameOfAllah[index]),
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemCount: contoller.nameOfAllah.length,
            ),
    );
  }
}
