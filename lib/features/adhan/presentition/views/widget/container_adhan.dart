import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:quran_app_android/core/util/icon_broken.dart';
class AdhanContainer extends StatefulWidget {
  const AdhanContainer({Key? key, required this.prayerTimes}) : super(key: key);
  final PrayerTimes prayerTimes;

  @override
  State<AdhanContainer> createState() => _AdhanContainerState();
}

class _AdhanContainerState extends State<AdhanContainer> {
  Timer? _timer;
  Map<String, DateTime>? _nextPrayerTime; // Change the type here

  @override
  void initState() {
    super.initState();
    _nextPrayerTime = _getNextPrayerTime();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Map<String, DateTime> _getNextPrayerTime() {
    final now = DateTime.now();
    final times = {
      'الفجر': _adjustPrayerTime(widget.prayerTimes.fajr),
      'الظهر': _adjustPrayerTime(widget.prayerTimes.dhuhr),
      'العصر': _adjustPrayerTime(widget.prayerTimes.asr),
      'المغرب': _adjustPrayerTime(widget.prayerTimes.maghrib),
      'العشاء': _adjustPrayerTime(widget.prayerTimes.isha),
    };
    final sortedTimes = times.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));
    return {
      sortedTimes.firstWhere((entry) => entry.value.isAfter(now)).key:
          sortedTimes.firstWhere((entry) => entry.value.isAfter(now)).value
    };
  }

  DateTime _adjustPrayerTime(DateTime prayerTime) {
    final now = DateTime.now();
    if (prayerTime.isBefore(now)) {
      return prayerTime.add(const Duration(days: 1));
    } else {
      return prayerTime;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      if (_nextPrayerTime != null &&
          _nextPrayerTime!.containsKey('Isha') &&
          now.isAfter(_nextPrayerTime!['Isha']!)) {
        _nextPrayerTime = _getNextPrayerTime();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final nextPrayer = _getNextPrayerTime();
    final nextPrayerName = nextPrayer.keys.first;
    final nextPrayerTime = nextPrayer.values.first;
    final remaining = nextPrayerTime.difference(DateTime.now());
    final hours = remaining.inHours;
    final minutes = remaining.inMinutes.remainder(60);
    final seconds = remaining.inSeconds.remainder(60);
    return Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
            color: Colors.black38,
            blurRadius: 8,
            offset: Offset(4, 4),
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white70,
            blurRadius: 10,
            offset: Offset(-4, -4),
            spreadRadius: 2,
          ),
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: const Offset(.5, 1),
              spreadRadius: 3,
              blurStyle: BlurStyle.inner),
        ],
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            IconBroken.Volume_Up,
            size: 50,
          ),
          Text(
            nextPrayerName,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black54,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                ),
          ),
          Text(
            '-$hours:$minutes:$seconds',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black54,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                ),
          ),
        ],
      ),
    );
  }
}
