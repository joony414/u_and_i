import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.parse("20231225");
  DateTime today = DateTime.now();

  void onHeartPressed() {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
                maximumDate: DateTime(today.year, today.month, today.day, 23, 59, 59, 99, 999),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    firstDay = date;
                  });
                }),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8c93c9),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            const _CoupleImage(),
          ],
        ),
      ),
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;
  const _DDay({required this.onHeartPressed, required this.firstDay});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          "U & I",
          style: textTheme.displayLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "우리 처음 만난 날",
          style: textTheme.bodyLarge,
        ),
        Text(
          "${firstDay.year}.${firstDay.month}.${firstDay.day}",
          style: textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        IconButton(
          iconSize: 60,
          onPressed: onHeartPressed,
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays}",
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  const _CoupleImage();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(
          'asset/img/middle_image.png',
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}
