
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inflearn_cf_random/constant/color.dart';
import 'package:inflearn_cf_random/screen/settings_sereen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 1000;
  List<int> randomNumbers = [123, 456, 789];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(onPressed: onPressedSettings,),
              _Body(randomNumbers: randomNumbers),
              _Footer(onPressed: onPressedGenerate,),
            ],
          ),
        ),
      ),
    );
  }
  void onPressedSettings () async{
    final result = await Navigator.of(context).push<int>(
      MaterialPageRoute(
        builder: (context) => SettingScreen(),
      ),
    );
    if(result != null) {
      setState(() {
        maxNumber = result;
    });
  }
  }

  void onPressedGenerate() {
    final rand = Random();
    final Set<int> newNumbers = {};
    while (newNumbers.length != 3){
      final number = rand.nextInt(maxNumber);
      newNumbers.add(number);
      setState(() {
        randomNumbers = newNumbers.toList();
      });
    }
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;
  const _Header({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '랜덤 숫자 생성기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.settings),
          color: SECONDARY_COLOR,
        ),
      ],
    );
  }
}
class _Body extends StatelessWidget {
  const _Body({super.key, required this.randomNumbers});
  final List<int> randomNumbers;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randomNumbers.asMap().entries
            .map(
              (e) =>
              Padding(
                padding:  EdgeInsets.only(bottom: e.key == 2 ? 0 : 16),
                child: Row(
                  children: e.value
                      .toString()
                      .split('')
                      .map(
                        (y) =>
                        Image.asset(
                          'asset/img/$y.png', width: 50, height: 70,
                        ),
                  ).toList(),
                ),
              ),
        ).toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: SECONDARY_COLOR,
        ),
        onPressed: onPressed,
        child: Text('생성'),
      ),
    );
  }
}
