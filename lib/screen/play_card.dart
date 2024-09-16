import 'package:firebaseseries/screen/widgets/meditationsteps.dart';
import 'package:flutter/material.dart';

class PlayCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final List<MeditationStep>
      step; // Make sure this references the correct MeditationStep

  const PlayCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.step,
  }) : super(key: key);

  @override
  State<PlayCard> createState() => _PlayCardState();
}

class _PlayCardState extends State<PlayCard> {
  @override
  Widget build(BuildContext context) {
    double _currentPosition = 38.0; // Current playback position
    double _maxDuration = 200.0; // Total duration of the audio

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
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            // Title
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
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
            SizedBox(height: 16.0),
            // Subtitle
            Center(
              child: Text(
                widget.subtitle,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 4.0),
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
            SizedBox(height: 30.0),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: SliderComponentShape.noThumb, // Removes the thumb
                overlayShape:
                    SliderComponentShape.noOverlay, // Removes the overlay
              ),
              child: Slider(
                value: _currentPosition,
                min: 0,
                max: _maxDuration,
                activeColor: Colors.black,
                inactiveColor: Colors.grey[300],
                onChanged: (value) {
                  setState(() {
                    _currentPosition = value;
                    // Update the audio playback position here
                  });
                },
              ),
            ),
            SizedBox(height: 16.0),
            // Playback Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_previous, size: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.fast_rewind, size: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_circle_fill,
                      size: 50, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.fast_forward, size: 30),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_next, size: 30),
                ),
              ],
            ),
            // Meditation Steps
            SizedBox(height: 16.0),
            // Pass the steps here
          ],
        ),
      ),
    );
  }
}
