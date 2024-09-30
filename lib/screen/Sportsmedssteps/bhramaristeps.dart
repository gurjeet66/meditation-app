import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:flutter/material.dart';

class bhramaristeps extends StatefulWidget {
  const bhramaristeps({super.key});

  @override
  State<bhramaristeps> createState() => _bhramaristepsState();
}

class _bhramaristepsState extends State<bhramaristeps> {
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
      "meditation":"Bhramari",
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
                "Bhramari(Bee Breath)",
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
                "Bhramari(Bee Breath)",
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
            const SizedBox(height: 30),

            // Steps Section with Custom Widget
            const MeditationStep(
              stepTitle: "Step 1: Preparation",
              description: [
                "Sit comfortably in a cross-legged position such as Sukhasana (Easy Pose) or Padmasana (Lotus Pose) with your spine straight and shoulders relaxed.",
                "Close your eyes and place your hands on your knees, palms facing up.",
                "Take a few deep breaths, inhaling through your nose and exhaling slowly through your mouth."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 2: Hand Position (Shanmukhi Mudra)",
              description: [
                "Close your ears using your thumbs.",
                "Place your index fingers lightly on your closed eyelids.",
                "Position your middle fingers on the sides of your nose.",
                "Your ring and little fingers should rest gently on your upper lip and lower lip, respectively."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 3: Inhale Deeply",
              description: [
                "Take a deep breath in through your nose, filling your lungs with air.",
                "Focus on the sensation of your breath entering and filling your body."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 4: Humming Exhale (Bhramari)",
              description: [
                "As you exhale, make a soft humming sound like a bee (hence the name 'Bhramari').",
                "Feel the vibrations of the sound resonate in your head and chest.",
                "Keep the sound soft and continuous, allowing it to calm your mind and soothe your nervous system."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 5: Maintain Focus",
              description: [
                "Focus on the sound and the vibrations it creates in your body. Let any distractions or thoughts fade into the background.",
                "The humming sound can naturally quiet the mind, helping you enter a deeper state of relaxation."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 6: Repeat the Process",
              description: [
                "Repeat the inhalation and humming exhale 5 to 7 times, or as long as it feels comfortable.",
                "With each repetition, deepen your focus on the vibrations and let go of any stress or tension."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 7: Relax and Observe",
              description: [
                "After completing the final round, bring your hands down to your knees and sit quietly with your eyes closed.",
                "Focus on the peaceful state of mind you've created, observing the calmness within.",
                "Let your breath return to its natural rhythm."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 8: Gently Open Your Eyes",
              description: [
                "When you feel ready, slowly open your eyes.",
                "Sit for a few moments, allowing yourself to adjust to your surroundings before moving."
              ],
            ),    ]
            
            

          
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
