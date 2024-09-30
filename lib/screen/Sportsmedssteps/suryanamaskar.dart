import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:flutter/material.dart';

class suryanamaskar extends StatefulWidget {
  const suryanamaskar({super.key});

  @override
  State<suryanamaskar> createState() => _suryanamaskarState();
}

class _suryanamaskarState extends State<suryanamaskar> {
   Stopwatch _stopwatch = Stopwatch();
  Timer ? _timer;
  bool isPlaying = false;
  double progress = 0.0;
  int elapsedTime=0;
  bool isTimerStarted = false;
  double maxDuration = 100.0;
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> _playlist = [
    'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
    "https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Sevish_-__nbsp_.mp3"
  ];
  int _currentTrackIndex = 0;
  bool _start = true;
  @override
  void initState() {
    super.initState();

    // Listen for audio position changes to update the slider
    _audioPlayer.onPositionChanged.listen((Duration duration) {
      setState(() {
        progress = duration.inMilliseconds.toDouble();
      });
    });

    // Listen for audio duration to set max duration of the slider
    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        maxDuration = duration.inMilliseconds.toDouble();
      });
    });

    // Listen for player state changes to update play/pause state
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  Future<void> _play() async {
    await _audioPlayer.play(
        UrlSource(_playlist[_currentTrackIndex])); // Updated to use UrlSource
  }

  Future<void> _pause() async {
    await _audioPlayer.pause();
  }

  Future<void> _resume() async {
    if (_start) {
      await _play();
      setState(() {
        _start = !_start;
      });
    }
    await _audioPlayer.resume();
  }

  Future<void> _next() async {
    if (_currentTrackIndex < _playlist.length - 1) {
      _currentTrackIndex++;
      await _play();
    }
  }

  Future<void> _previous() async {
    if (_currentTrackIndex > 0) {
      _currentTrackIndex--;
      await _play();
    }
  }

  Future<void> _forward() async {
    final currentPosition = await _audioPlayer.getCurrentPosition();
    final duration = await _audioPlayer.getDuration();
    if (currentPosition != null && duration != null) {
      final newPosition = currentPosition + const Duration(seconds: 10);
      await _audioPlayer.seek(newPosition);
    }
  }

  Future<void> _backward() async {
    final currentPosition = await _audioPlayer.getCurrentPosition();
    if (currentPosition != null) {
      final newPosition = currentPosition - const Duration(seconds: 10);
      await _audioPlayer.seek(newPosition);
    }
  }

  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  @override
 void dispose (){
  _timer?.cancel();
  super.dispose();
 }
 Future<void>_saveTimeToFirebase()async{
  try{
    await _dbRef.child("users").child("userId").child("meditation_session").push().set({
      "meditation":"warrior Pose Sequence",
      "time_spent": elapsedTime,
      "timestamp":DateTime.now().millisecondsSinceEpoch,
    });
  }catch(e){
    print("Error saving time to Firebase:$e");
  }
 }
 void _startTimer(){
  setState(() {
    isPlaying =true;
    isTimerStarted = true;
  });
  _timer = Timer.periodic(const Duration(seconds: 1),(Timer timer){
    setState(() {
      elapsedTime++;
    });

  });
 }
 void _stopAndSaveTime(){
  if(isTimerStarted){
    _timer?.cancel();
    _saveTimeToFirebase();
  }
  Navigator.pop(context);
 }
 void _cancelAndStopTime(){
  _timer?.cancel();
  _saveTimeToFirebase();
  Navigator.pop(context);
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quick Meditation",
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: const Text(
                "Surya Namaskar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(height: 16),
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
                    'assets/designers_28349_Generate_a_realistic_image_of_a_person_sittin_fe3dec11-b343-4b43-a344-0503ebf3d69a_2 1.png', // Replace with correct image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                " Surya Namaskar",
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
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(child: Text("Start :$elapsedTime"), onPressed: (){
                  isTimerStarted?null:_startTimer();
                }),
                CustomButton(child: Text("Cancel"), onPressed: (){
                  _cancelAndStopTime();
                })
              ],
            ),

          
            Column(
              children: [
                Slider(
                  value: progress,
                  onChanged: (newValue) {
                      setState(() {
                      progress = newValue;
                      _audioPlayer
                          .seek(Duration(milliseconds: newValue.toInt()));
                    });
                  
                  },
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey,
                  min: 0,
                  max: maxDuration, 
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
                         onPressed: () {
                        if (isPlaying) {
                          _pause();
                        } else {
                          _resume();
                        }
                      }
                    ),
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

            // Steps Section with Custom Widget
               // Steps Section with Custom Widget
            const MeditationStep(
              stepTitle: "Step 1: Pranamasana (Prayer Pose)",
              description: [
                "Inhale: Stand upright with feet together and palms pressed together in front of the chest in a prayer position.",
                "Exhale: Relax your body and focus on your breath, preparing for the flow."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 2: Hastauttanasana (Raised Arms Pose)",
              description: [
                "Inhale: Raise your arms above your head and gently arch your back, stretching your whole body upwards.",
                "Reach back slightly but keep your spine long and straight."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 3: Hasta Padasana (Hand to Foot Pose)",
              description: [
                "Exhale: Bend forward from the hips and bring your hands down to the floor beside your feet.",
                "Try to touch your forehead to your knees, or bend your knees slightly if needed."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 4: Ashwa Sanchalanasana (Equestrian Pose)",
              description: [
                "Inhale: Step your right foot back as far as you can and drop your right knee to the ground.",
                "Lift your chest and look forward, keeping your left knee bent at a right angle."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 5: Dandasana (Plank Pose)",
              description: [
                "Exhale: Step your left foot back to come into a plank position, with your body in a straight line.",
                "Keep your arms perpendicular to the floor, and engage your core muscles."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 6: Ashtanga Namaskara (Eight-Limbed Pose)",
              description: [
                "Exhale: Lower your knees, chest, and chin to the floor, keeping your hips slightly raised.",
                "Your hands, chest, knees, and feet should all be touching the ground (eight points of contact)."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 7: Bhujangasana (Cobra Pose)",
              description: [
                "Inhale: Slide forward and raise your chest into a gentle backbend, keeping your elbows slightly bent.",
                "Lift your head and look upward, keeping your lower body grounded."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 8: Adho Mukha Svanasana (Downward-Facing Dog Pose)",
              description: [
                "Exhale: Lift your hips up and back into an inverted 'V' shape, straightening your arms and legs.",
                "Press your heels toward the floor and lengthen your spine."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 9: Ashwa Sanchalanasana (Equestrian Pose)",
              description: [
                "Inhale: Step your right foot forward between your hands, dropping your left knee to the floor.",
                "Lift your chest and look forward, keeping your right knee bent."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 10: Hasta Padasana (Hand to Foot Pose)",
              description: [
                "Exhale: Bring your left foot forward and bend down, placing your hands on the floor beside your feet.",
                "Try to touch your forehead to your knees."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 11: Hastauttanasana (Raised Arms Pose)",
              description: [
                "Inhale: Rise up, sweeping your arms overhead and gently arching your back to stretch upwards.",
                "Keep your spine long and straight as you reach back."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 12: Pranamasana (Prayer Pose)",
              description: [
                "Exhale: Bring your palms back together in front of your chest, returning to the starting prayer position.",
                "Take a few deep breaths before repeating the sequence on the other side."
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MeditationStep extends StatelessWidget {
  final String stepTitle;
  final List<String> description;
  

  const MeditationStep({
    super.key,
    required this.stepTitle,
    required this.description,
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              stepTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                color: Colors.black,
              ),
            ),
          ),
          
          const SizedBox(height: 10),
          // Display each description with bullet points
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: description.map((description) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: const Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          description,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
