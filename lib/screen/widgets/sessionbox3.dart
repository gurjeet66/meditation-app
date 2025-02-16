import 'package:firebaseseries/screen/Quickmeditation.dart';
import 'package:flutter/material.dart';
import 'package:firebaseseries/screen/profile.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';

class SessionBoxScreen3 extends StatefulWidget {
  final String titletext;
  final String subtitletext;
  final String lowertext;
  final String Image1;
  final VoidCallback onTap;

  const SessionBoxScreen3({
    super.key,
    required this.titletext,
    required this.subtitletext,
    required this.lowertext,
    required this.Image1,
    required this.onTap,
  });

  @override
  State<SessionBoxScreen3> createState() => _SessionBoxScreen3State();
}

class _SessionBoxScreen3State extends State<SessionBoxScreen3> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width * 0.95, // Increas
        decoration: BoxDecoration(
          color: const Color(0xff151F29),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
            clipBehavior:
                Clip.none, // Allows elements to overflow the container
            children: [
              // Left section for text content
              Positioned(
                top: 15,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.titletext,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: color1,
                      ),
                    ),
                    Text(
                      widget.subtitletext,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: color8,
                      ),
                    ),
                    Text(
                      widget.lowertext,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: color8,
                      ),
                    ),
                  ],
                ),
              ),
              // Image on the right side
              Positioned(
                right: 20,
                bottom: 6,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage(widget.Image1),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              // Label image (above text)

              // ElevatedButton at the bottom left
            ]),
      ),
    );
  }
}
