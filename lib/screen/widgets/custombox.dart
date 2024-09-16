import 'package:firebaseseries/screen/meditation5.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class custombox extends StatelessWidget {
  final String ImagePath;
  final String titletext;
  final String labeltext;

  // Constructor with required parameters
  const custombox({
    Key? key,
    required this.ImagePath,
    required this.titletext,
    required this.labeltext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ScreenOne()));
          },
          child: Container(
            height: 188,
            width: 264,
            child: Image.asset("$ImagePath"),
          ),
        ),
        Text(
          titletext,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: color2),
        ),
        Text(
          labeltext,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: color13),
        ),
      ],
    );
  }
}
