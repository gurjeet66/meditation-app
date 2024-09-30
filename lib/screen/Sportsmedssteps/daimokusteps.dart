import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:firebaseseries/screen/widgets/button1.dart';
import 'package:flutter/material.dart';

class daimokusteps extends StatefulWidget {
  const daimokusteps({super.key});

  @override
  State<daimokusteps> createState() => _daimokustepsState();
}

class _daimokustepsState extends State<daimokusteps> {
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
      "meditation":"Daimoku",
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
                "Daimoku (Chanting Nam-Myoho-Renge-Kyo)",
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
                "Daimoku (Chanting Nam\n-Myoho-Renge-Kyo)",
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
              stepTitle: "Step 1: Prepare Yourself",
              description:[ "Sit in a comfortable position with your back straight and hands resting on your lap.",
"Close your eyes and take a few deep breaths to relax and focus.",],
            
            ),
            const MeditationStep(
              stepTitle: "Step 2:Begin Chanting",
              description: ["Start chanting “Nam-Myoho-Renge-Kyo” aloud.",
"Focus on the sound of your voice and the vibration of the words.",
"Chant at a pace that feels comfortable for you—either slow and meditative or more rhythmic.",

              ],
            ),
            const MeditationStep(
              stepTitle: "Step 3: Find a Rhythm",
              description: ["Chant continuously, focusing on the mantra’s meaning and sound.",
"With each repetition, allow yourself to go deeper into the sound and vibration.",
"Keep your attention on the chant, letting any distracting thoughts fade away..",
              ]
            
            ),
            const MeditationStep(
              stepTitle: "Step 4:Continue for Several Minutes",
              description: [
"Chant Nam-Myoho-Renge-Kyo for 10 to 15 minutes or as long as you wish.",
"You can set a timer or stop when you feel a sense of inner peace or completion.",
              ]
            
            ),
             const MeditationStep(
              stepTitle: "Step 5: Closing",
              description: ["After chanting, sit in silence for a few moments to let the vibrations settle within you.",
"Slowly open your eyes, carrying the energy of the practice into your day.",



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
