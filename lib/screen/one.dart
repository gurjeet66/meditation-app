import 'package:firebaseseries/screen/widgets/customexercise1.dart';
import 'package:flutter/material.dart';


class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool isPlaying = false;
  double progress = 0.0; // Represents the current progress of the audio
  
  void _playPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }
  
  void _forward() {
    // Logic to forward the audio
  }
  
  void _backward() {
    // Logic to backward the audio
  }
  
  void _next() {
    // Logic to play the next audio
  }
  
  void _previous() {
    // Logic to play the previous audio
  }

  @override
  Widget build(BuildContext context) {
    var myheight = MediaQuery.of(context).size.height;
    var mywidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
        ),
        title: const Text('Pre-Match Stress', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  name(topic_name: "Pranayam (Breath Control)"),
                  SizedBox()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 0, 10),
              child: Container(
                height: myheight / 4,
                width: mywidth / 1.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: audio_name(name: 'Pre-Match Stress'),
            ),
            Text('Health', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Container(
              width: mywidth / 1.2,
              child: Column(
                children: [
                  // Audio Progress Bar
                  Slider(
                    value: progress,
                    onChanged: (newValue) {
                      setState(() {
                        progress = newValue;
                      });
                    },
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                    thumbColor: Colors.transparent, // Makes the knob invisible
                    // Track height
                    min: 0.0,
                    max: 1.0,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Previous Button
                      IconButton(
                        icon: Icon(Icons.skip_previous, size: 50, color: Colors.black),
                        onPressed: _previous,
                      ),
                      // Backward Button
                      IconButton(
                        icon: Icon(Icons.fast_rewind, size: 40, color: Colors.black),
                        onPressed: _backward,
                      ),
                      // Play/Pause Button
                      IconButton(
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_circle, size: 60, color: Color.fromARGB(255, 7, 0, 217)),
                        onPressed: _playPause,
                      ),
                      // Forward Button
                      IconButton(
                        icon: Icon(Icons.fast_forward, size: 40, color: Colors.black),
                        onPressed: _forward,
                      ),
                      // Next Button
                      IconButton(
                        icon: Icon(Icons.skip_next, size: 50, color: Colors.black),
                        onPressed: _next,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}