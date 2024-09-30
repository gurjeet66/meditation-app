import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:flutter/material.dart';

class Yoganidrasteps extends StatefulWidget {
  
  const Yoganidrasteps({super.key, });

  @override
  State<Yoganidrasteps> createState() => _YoganidrastepsState();
}

class _YoganidrastepsState extends State<Yoganidrasteps> {
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
      "meditation":"Yoga Nidra ",
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
              padding: const EdgeInsets.only(left: 120),
              child: const Text(
                "Yoga Nidra ",
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
                "Yoga Nidra",
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
                      },
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
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(child: Text("Start:$elapsedTime"), onPressed: (){
                  isTimerStarted?null:_startTimer();
                }),
                CustomButton(child: Text("Cancel"), onPressed: (){
                  _cancelAndStopTime();
                })
              ],
            ),
           SizedBox(height: 30),

            // Steps Section with Custom Widget
            const MeditationStep(
              stepTitle: "Step 1:Set Your Intention (Sankalpa)",
              description:[ "Lie down in Shavasana (corpse pose) on your back with legs slightly apart and arms resting at your sides, palms facing up.",
"Close your eyes and take a few deep breaths.",
"Set a positive intention or Sankalpa for your Yoga Nidra practice, a simple statement in the present tense, such as “I am calm and peaceful” or “I am strong and focused."],
            
            ),
            const MeditationStep(
              stepTitle: "Step 2: Body Awareness (Rotation of Consciousness)",
              description: ["Begin to bring awareness to different parts of your body, starting with the right side.",
"Mentally repeat and focus on each body part as you move your attention:",
"Right side: Right thumb, fingers, hand, wrist, forearm, elbow, upper arm, shoulder, right side of the chest, waist, right hip, thigh, knee, calf, ankle, foot, toes.",
"Left side: Repeat the same process for the left side.",
"Back: Move awareness to the spine, back, and buttocks.",
"Front: Focus on the abdomen, chest, throat, and face.",
"Allow each body part to fully relax as you become aware of it.",
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 3:Breath Awareness",
              description: ["IShift your awareness to your natural breath.",
"Focus on the gentle rise and fall of your abdomen with each breath.",
"Observe your breath without trying to control it.",
"Imagine the breath moving in and out of your body like a wave, calming your mind with every exhale..",
              ]
            
            ),
            const MeditationStep(
              stepTitle: "Step 4: Sensation Awareness",
              description: ["Now, bring your attention to sensations in the body. Imagine opposite sensations:",
"Heaviness: Feel your body become heavy, sinking deeper into the floor.",
"Lightness: Now feel a sense of lightness, as though your body is floating.",
"Move between these sensations a few times.",
              ]
            
            ),
             const MeditationStep(
              stepTitle: "Step 5: Visualization",
              description: ["Visualize peaceful images or scenarios that bring a sense of calm and tranquility. This could be a walk on a beach, a mountain landscape, or floating in the clouds.",
"You can also visualize a specific healing image or color flooding your body, bringing peace and relaxation.",
              ]
            
            ),
            const MeditationStep(
              stepTitle: "Step 6: Returning to the Present Moment",
              description: ["Slowly bring your awareness back to your body lying on the floor.",
"Take a deep breath in, and as you exhale, slowly become aware of the room around you.",
"Wiggle your fingers and toes, gently stretching your body.",
"When ready, slowly roll to one side and sit up with your eyes closed.",
              ]
            
            ),
            const MeditationStep(
              stepTitle: "Step 7:  Ending the Practice",
              description: ["Recall your Sankalpa (intention) once again and mentally repeat it three times.",
"Slowly open your eyes and sit for a few moments before moving..",
              ]
            
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
          Text(
            stepTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
              color: Colors.black,
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
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black,
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