import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const CustomButton1({
    required this.child,
    required this.onPressed,
    Key? key,
    this.width = 150,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: color6,
            backgroundColor: color3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: child,
      ),
    );
  }
}
