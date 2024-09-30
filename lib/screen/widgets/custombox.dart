import 'package:firebaseseries/screen/Recoommendedmeditation/recommendedmed1.dart';

import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class custombox extends StatelessWidget {
  final String ImagePath;
  final String titletext;
  final String labeltext;
  final VoidCallback onTap;

  // Constructor with required parameters
  const custombox({
    super.key,
    required this.ImagePath,
    required this.titletext,
    required this.labeltext, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 188,
            width: 264,
            child: Image.asset(ImagePath),
          ),
        ),
        Text(
          titletext,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: color2),
        ),
        Text(
          labeltext,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: color13),
        ),
      ],
    );
  }
}
