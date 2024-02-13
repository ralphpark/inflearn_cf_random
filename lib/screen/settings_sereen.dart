import 'package:flutter/material.dart';
import 'package:inflearn_cf_random/component/number_row.dart';
import 'package:inflearn_cf_random/constant/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key, required this.maxNumber});
  final int maxNumber;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    super.initState();
    maxNumber = widget.maxNumber.toDouble();
  }
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
              _Body(maxNumber: maxNumber,),
              _Footer(
                onSliderChanged: onSliderChanged,
                onPressed: onPressedSave,
                maxNumber: maxNumber,),
            ],
          ),
        ),
      )
    );
  }
  void onSliderChanged (double val){
    setState(() {
      maxNumber = val;
    });
  }
  void onPressedSave(){
    Navigator.of(context).pop(maxNumber.toInt());
  }
}


//body
class _Body extends StatelessWidget {
  final double maxNumber;
  const _Body({super.key, required this.maxNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(number: maxNumber.toInt()),
    );
  }
}

//footer
class _Footer extends StatelessWidget {
  const _Footer({super.key, required this.onSliderChanged, required this.maxNumber, required this.onPressed});
  final ValueChanged<double> onSliderChanged;
  final VoidCallback onPressed;
  final double maxNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 1000000,
          onChanged: onSliderChanged,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: SECONDARY_COLOR,
                ),
                onPressed: onPressed,
                child: Text('저장'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


