import 'package:flutter/material.dart';
import 'package:inflearn_cf_random/constant/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 10000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: maxNumber.toInt()
                        .toString()
                        .split('')
                        .map(
                          (e) => Image.asset('asset/img/$e.png',width: 50, height: 70,)
                        ).toList(),
                  ),
              ),
              Slider(
                  value: maxNumber,
                  min: 10000,
                  max: 1000000,
                  onChanged: (double val){
                    setState(() {
                      maxNumber = val;
                    });
                  },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: SECONDARY_COLOR,
                ),
                onPressed: (){
                  Navigator.of(context).pop(maxNumber.toInt());
                },
                child: Text('저장'),
              ),
            ],
          ),
        ),
      )
    );
  }
}
