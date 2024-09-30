import 'package:flutter/material.dart';

class ChoiceCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<String> tags;
  final String description;
  final VoidCallback onStart;
 

  const ChoiceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.tags,
    required this.description,
    required this.onStart,
    
  });

  @override
  _ChoiceCardState createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<ChoiceCard> {
  double _volume = 0.5;
  bool _enableVoiceGuidance = false;
  bool _enableBackgroundSound = false;
  bool _enableHapticFeedback = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)
        
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
  SizedBox(
    width: 10,
  ),
            Text(
              widget.subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            
              Wrap(
                spacing: 8.0,
                children: widget.tags.map((tag) => _buildTag(tag)).toList(),
              ),
            
            const SizedBox(height: 15),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Text('Adjust Volume', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Slider(
              value: _volume,
              onChanged: (value) {
                setState(() {
                  _volume = value;
                });
              },
              min: 0,
              max: 1,
            ),
            SwitchListTile(
              title: const Text('Enable Voice Guidance'),
              value: _enableVoiceGuidance,
              onChanged: (value) {
                setState(() {
                  _enableVoiceGuidance = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Enable Background Sound'),
              value: _enableBackgroundSound,
              onChanged: (value) {
                setState(() {
                  _enableBackgroundSound = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Enable Haptic Feedback'),
              value: _enableHapticFeedback,
              onChanged: (value) {
                setState(() {
                  _enableHapticFeedback = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Set custom timer (minutes)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: widget.onStart,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.black,
                
              ),
              child: const Text('Start', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.grey[200],
    );
  }
}