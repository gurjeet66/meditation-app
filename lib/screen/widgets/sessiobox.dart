import 'package:flutter/material.dart';
import 'package:firebaseseries/screen/profile.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';

class SessionBoxScreen extends StatefulWidget {
  final String labelImagePath;
  final String vectorImagePath;
  final String titletext;
  final String subtitletext;
  final String lowertext;
  final VoidCallback onpressed;

  const SessionBoxScreen({
    Key? key,
    required this.labelImagePath,
    required this.vectorImagePath,
    required this.titletext,
    required this.subtitletext,
    required this.lowertext,
    required this.onpressed,
  }) : super(key: key);

  @override
  State<SessionBoxScreen> createState() => _SessionBoxScreenState();
}

class _SessionBoxScreenState extends State<SessionBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 330,
      decoration: BoxDecoration(
        color: const Color(0xff151F29),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.none, // Allows elements to overflow the container
        children: [
          // Left section for text content
          Positioned(
            top: 5,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.titletext,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: color1,
                  ),
                ),
                Text(
                  widget.subtitletext,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: color1,
                  ),
                ),
                Text(
                  widget.lowertext,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: color1,
                  ),
                ),
              ],
            ),
          ),
          // Image on the right side
          Positioned(
            right: 20,
            bottom: 5,
            child: Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(widget.vectorImagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Label image (above text)
          Positioned(
            top: 50,
            left: 120,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(widget.labelImagePath),
                ),
              ),
            ),
          ),
          // ElevatedButton at the bottom left
          Positioned(
            bottom: 10,
            left: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color1,
                minimumSize: const Size(101, 33),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),onPressed: widget.onpressed,
            
                
           
                
                  
                
              
              child: const Text("Start"),
            )
          )
              ]
            ),

          
        
      
    );
  }
}
