import 'package:flutter/material.dart';



class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  bool isPlaying = false;
  double progress = 0.0;

  //@override
  // void initState() {
  //   super.initState();
  //   _audioPlayer.onAudioPositionChanged.listen((position) {
  //     setState(() {
  //       progress = position.inSeconds.toDouble();
  //     });
  //   });
  // }

  // void _playPause() async {
  //   if (isPlaying) {
  //     await _audioPlayer.pause();
  //   } else {
  //     await _audioPlayer.play(AssetSource('audio/meditation.mp3')); // Ensure the audio file is in assets
  //   }
  //   setState(() {
  //     isPlaying = !isPlaying;
  //   });
  // }

  void _forward() {
    // Logic to forward the audio
  }

  void _backward() {
    // Logic to rewind the audio
  }

  void _next() {
    // Logic to play next
  }

  void _previous() {
    // Logic to play previous
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meditation for Tennis",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pranayama (Breath Control)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/meditation_image.png', // Ensure the image is in assets
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Pre-Match Stress",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Headspace",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),

              // Audio Player
              Column(
                children: [
                  Slider(
                    value: progress,
                    onChanged: (newValue) {
                      setState(() {
                        progress = newValue;
                      });
                      // Logic to seek audio position
                    },
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                    min: 0,
                    max: 100, // Replace with your audio length in seconds
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.skip_previous,
                          size: 50,
                          color: Colors.black,
                        ),
                        onPressed: _previous,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.fast_rewind,
                          size: 40,
                          color: Colors.black,
                        ),
                        onPressed: _backward,
                      ),
                      IconButton(
                          icon: Icon(
                            isPlaying ? Icons.pause : Icons.play_circle,
                            size: 60,
                            color: const Color.fromARGB(255, 7, 0, 217),
                          ),
                          onPressed: () {}),
                      IconButton(
                        icon: const Icon(
                          Icons.fast_forward,
                          size: 40,
                          color: Colors.black,
                        ),
                        onPressed: _forward,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.skip_next,
                          size: 50,
                          color: Colors.black,
                        ),
                        onPressed: _next,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Steps Section
              const StepItem(
                stepTitle: "Step 1: Prepare Your Space",
                stepDescription:
                    "Sit comfortably in a cross-legged position or on a chair. Close your eyes and place your hands on your knees in a relaxed position.",
              ),
              const SizedBox(height: 20),
              const StepItem(
                stepTitle: "Step 2: Focus on Breath",
                stepDescription:
                    "Take a few deep breaths to center yourself, focusing on the inhalation and exhalation.",
              ),
              const SizedBox(height: 20),
              const StepItem(
                stepTitle: "Step 3: Chanting Ohm",
                stepDescription:
                    "Begin chanting 'Ohm' slowly and melodiously, feeling the vibration in your chest and throat. Chant for 5-10 minutes.",
              ),
              const SizedBox(height: 20),
              const StepItem(
                stepTitle: "Step 4: Concentration",
                stepDescription:
                    "Focus entirely on the sound and vibration of 'Ohm' to deepen your meditation.",
              ),
              const SizedBox(height: 20),
              const StepItem(
                stepTitle: "Step 5: Closing",
                stepDescription:
                    "Gradually reduce the chanting, returning to deep breathing before opening your eyes.",
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class StepItem extends StatelessWidget {
  final String stepTitle;
  final String stepDescription;

  const StepItem({
    Key? key,
    required this.stepTitle,
    required this.stepDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 10.0), // Spacing between steps
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stepTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5), // Space between title and description
          Text(
            stepDescription,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
