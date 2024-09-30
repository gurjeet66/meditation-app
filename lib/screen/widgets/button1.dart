import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const CustomButton({
    required this.child,
    required this.onPressed,
    super.key,
    this.width = 150,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          
          foregroundColor: color1, backgroundColor: color7,
          shape: RoundedRectangleBorder(
            
              borderRadius: BorderRadius.circular(12)), // Text color
          // Button size
        ),
        child: child,
      ),
    );
  }
}
