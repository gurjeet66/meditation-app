import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Steps extends StatefulWidget {
  const Steps(
      {super.key,
      required this.Title,
      required this.description1,
      
      required this.description2, required this.Image});
  final String Title;
  final String description1;
  final String description2;
  final String Image;

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(widget.Image),
          Text(
            widget.Title,
            style: const TextStyle(
                color: color2, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Row(children: [
            Container(
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
              ),
            ),
            Text(
              widget.description1,
              style: const TextStyle(
                  color: color2, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ]),
          Row(children: [
            Container(
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: color2,
              ),
            ),
            Text(
              widget.description1,
              style: const TextStyle(
                  color: color2, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ]),
        ],
      ),
    );
  }
}
