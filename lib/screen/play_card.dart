import 'package:firebaseseries/screen/widgets/meditationsteps.dart';
import 'package:flutter/material.dart';

class PlayCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  
       // Make sure this references the correct MeditationStep

  const PlayCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    
  });

  @override
  State<PlayCard> createState() => _PlayCardState();
}

class _PlayCardState extends State<PlayCard> {
  @override
  Widget build(BuildContext context) {
    double currentPosition = 38.0; // Current playback position
    double maxDuration = 200.0; // Total duration of the audio

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            // Title
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            // Image Section
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.imageUrl,
                  height: 200,
                  width: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Subtitle
            Center(
              child: Text(
                widget.subtitle,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            // Source
            Center(
              child: Text(
                'Headspace',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: SliderComponentShape.noThumb, // Removes the thumb
                overlayShape:
                    SliderComponentShape.noOverlay, // Removes the overlay
              ),
              child: Slider(
                value: currentPosition,
                min: 0,
                max: maxDuration,
                activeColor: Colors.black,
                inactiveColor: Colors.grey[300],
                onChanged: (value) {
                  setState(() {
                    currentPosition = value;
                    // Update the audio playback position here
                  });
                },
              ),
            ),
            const SizedBox(height: 16.0),
            // Playback Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous, size: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fast_rewind, size: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.play_circle_fill,
                      size: 50, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fast_forward, size: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next, size: 30),
                ),
              ],
            ),
            // Meditation Steps
            const SizedBox(height: 16.0),
            // Pass the steps here
          ],
        ),
      ),
    );
  }
}
