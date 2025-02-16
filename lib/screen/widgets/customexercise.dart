import 'package:flutter/material.dart';

Text pranayam = const Text("Pranayam (Breath Control)",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),);
Text Pre_Match =  const Text("Pre_Match Depression",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),);
Text description =  const Text("Calms the mind and reduces anxiety helping players focus and enter the match with a calm and clear mindset",style: TextStyle(fontSize: 16),);
Text Voice_Guidance = const Text("Enable Voice Guidance",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16));
Text Background_sound = const Text("Enable Background Sound",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16));
Text Haptic_Feedback = const Text("Enable Haptic Feedback",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16));


Container benefits ({
String  name = " "
})
{
  return  Container(
    alignment: Alignment.center,
    height: 35,
    
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
      child: Text(name),
    ),
  );
}