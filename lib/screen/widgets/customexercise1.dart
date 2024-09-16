import 'package:flutter/material.dart';

Text pranayam = Text(
  "Pranayam (Breath Control)",
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
);
Text Pre_Match = Text(
  "Pre_Match Depression",
  style:
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
);
Text description = Text(
  "Calms the mind and reduces anxiety helping players focus and enter the match with a calm and clear mindset",
  style: TextStyle(fontSize: 16),
);
Text Voice_Guidance = Text("Enable Voice Guidance",
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
Text Background_sound = Text("Enable Background Sound",
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
Text Haptic_Feedback = Text("Enable Haptic Feedback",
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
Text name({String topic_name = ""}) {
  return Text(
    topic_name,
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  );
}

Text audio_name({String name = ""}) {
  return Text(
    name,
    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
  );
}

Text label({String label_name = ""}) {
  return Text(
    label_name,
    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  );
}
