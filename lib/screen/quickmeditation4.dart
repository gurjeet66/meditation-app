import 'package:firebaseseries/screen/utils/app_colors.dart';
import 'package:flutter/material.dart';

class quickmeditation4 extends StatefulWidget {
  const quickmeditation4({super.key});

  @override
  State<quickmeditation4> createState() => _quickmeditation4State();
}

class _quickmeditation4State extends State<quickmeditation4> {
  bool isPlaying = false;
  double progress = 0.0;

  void _forward() {}
  void _backward() {}
  void _next() {}
  void _previous() {}

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
              padding: const EdgeInsets.only(left: 90),
              child: const Text(
                "Quick Meditation",
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
                    'assets/designers_28349_Generate_a_realistic_image_of_a_person_sittin_fe3dec11-b343-4b43-a344-0503ebf3d69a_2 1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Quick Meditation",
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
                    });
                  },
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey,
                  min: 0,
                  max: 100,
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
                        setState(() {
                          isPlaying = !isPlaying;
                        });
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
                "Stand tall with your feet together, arms at your side.",
                "Inhale deeply and feel your body grounding into the earth.",
                "Relax your shoulders and take a moment to center yourself.",
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 2: Warrior I Pose (Virabhadrasana I)",
              description: [
                "Step your left foot back about 3-4 feet.",
                "Turn your left foot slightly outward, and keep your right foot facing forward.",
                "Bend your right knee at a 90-degree angle, ensuring it aligns with your ankle.",
                "Raise your arms overhead, palms facing each other, shoulders relaxed.",
                "Hold this position, inhaling deeply and feeling the strength in your legs and arms."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 3: Warrior II Pose (Virabhadrasana II)",
              description: [
                "From Warrior I, open your hips and chest to the left, keeping your legs in the same position.",
                "Stretch your arms out to the sides at shoulder height, parallel to the floor.",
                "Gaze over your right hand, keeping your spine tall and strong.",
                "Hold the pose and breathe deeply."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 4: Warrior III Pose (Virabhadrasana III)",
              description: [
                "Shift your weight to your right foot and slowly lean forward.",
                "Lift your left leg straight behind you while extending your arms forward.",
                "Keep your body in a straight line, forming a 'T' shape.",
                "Hold this balancing pose for a few breaths, engaging your core for stability."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 5: Return to Standing",
              description: [
                "Gently release the pose, lowering your left leg and bringing your arms back to your sides.",
                "Repeat the sequence on the opposite side, stepping your right foot back."
              ],
            ),

            // Adding new meditation techniques as steps
            const MeditationStep(
              stepTitle: "Step 6: Pranayama with Nadi Shodhana",
              description: [
                "Sit in a cross-legged position with a straight back.",
                "Use your right thumb to close your right nostril, and inhale deeply through the left nostril.",
                "Close the left nostril with your ring finger, release the right nostril, and exhale.",
                "Inhale through the right nostril, close it, and exhale through the left.",
                "Repeat for several minutes."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 7: Yoga Nidra (Guided Relaxation)",
              description: [
                "Lie on your back with arms by your sides, palms facing up.",
                "Close your eyes and relax your body with a mental body scan.",
                "Breathe deeply and visualize a peaceful scene.",
                "Hold for 5-10 minutes, focusing on the breath and relaxation."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 8: Dhyana with Trataka (Candle Gazing)",
              description: [
                "Place a candle at eye level, sit comfortably, and gaze steadily at the flame.",
                "Breathe deeply and keep your focus on the flame.",
                "After a few minutes, close your eyes and visualize the flame.",
                "Repeat the process as desired."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 9: Bhujangasana (Cobra Pose)",
              description: [
                "Lie on your stomach with your legs extended and palms under your shoulders.",
                "Inhale and gently lift your chest, keeping your elbows close to your body.",
                "Hold for a few breaths, feeling the stretch in your spine and chest.",
                "Exhale and lower back down."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 10: Savasana (Corpse Pose)",
              description: [
                "Lie flat on your back with arms at your sides, palms facing up.",
                "Close your eyes and let your body completely relax.",
                "Focus on your breath and allow your thoughts to drift away.",
                "Remain in this pose for 5-10 minutes to end your practice."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 11: Viparita Karani (Legs Up the Wall Pose)",
              description: [
                "Sit with one side of your body next to a wall.",
                "Lie on your back and extend your legs up the wall.",
                "Relax your arms by your sides and breathe deeply.",
                "Stay in this pose for several minutes to relieve tension."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 12: Baddha Konasana (Bound Angle Pose)",
              description: [
                "Sit with your legs extended in front of you.",
                "Bend your knees and bring the soles of your feet together.",
                "Hold your feet with your hands and gently press your knees toward the floor.",
                "Breathe deeply and hold for several breaths."
              ],
            ),
            const MeditationStep(
              stepTitle: "Step 13: Meditation with Focused Breath",
              description: [
                "Sit comfortably in a cross-legged position.",
                "Close your eyes and focus on your breath.",
                "Inhale deeply through your nose, hold for a moment, then exhale slowly.",
                "Continue for 5-10 minutes, bringing your attention back to the breath whenever your mind wanders."
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
