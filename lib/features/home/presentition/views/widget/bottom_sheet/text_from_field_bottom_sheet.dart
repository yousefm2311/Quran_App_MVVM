import 'package:flutter/material.dart';
import 'package:quran_app_android/features/home/presentition/view_model/home_view_model.dart';

class TextFormFieldBottomSheet extends StatelessWidget {
  const TextFormFieldBottomSheet({super.key, required this.controller});

  final HomeViewModel controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'الحقل فارغ';
        }
        try {
          int intValue = int.parse(value);
          if (intValue < 1) {
            return ' القيمة يجب ان تكون اكبر من 1';
          }
          return null; // Value is a valid integer
        } catch (e) {
          return 'القيمة يجب أن تكون عدد صحيح'; // Invalid integer value
        }
      },
      controller: controller.timeController,
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        hintText: 'ادخل الوقت',
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
