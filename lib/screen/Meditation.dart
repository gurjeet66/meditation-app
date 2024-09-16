// import 'package:firebaseseries/screen/play_card.dart';
// import 'package:firebaseseries/screen/widgets/meditationsteps.dart';
// import 'package:flutter/material.dart';

// class ScreenTwo extends StatefulWidget {
//   const ScreenTwo({super.key});

//   @override
//   State<ScreenTwo> createState() => _ScreenTwoState();
// }

// class _ScreenTwoState extends State<ScreenTwo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 20,
//             width: 20,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10), color: Colors.black),
//             child: IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                 )),
//           ),
//         ),
//         title: Text(
//           "Meditation for tennis",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             PlayCard(
//               title: 'Pranayam (Breath Control)',
//               subtitle: 'Pre-Mtach Stress',
//               imageUrl:
//                   'https://s.yimg.com/uu/api/res/1.2/JPnlrRZ8yrKd71YYY1zGwQ--~B/aD0xNDk0O3c9MjQwMDtzbT0xO2FwcGlkPXl0YWNoeW9u/https://media.zenfs.com/en/time_72/e20d4fbe29a3cca80091ad8dda976c12',
//               step: [
//                 MeditationStep(
//                   description:
//                       'Preparation: Sit comfortably in a cross-legged position or on a chair. Close your eyes and place your hands on your knees in a relaxed position.',
//                   imageUrl:
//                       'https://s.yimg.com/uu/api/res/1.2/JPnlrRZ8yrKd71YYY1zGwQ--~B/aD0xNDk0O3c9MjQwMDtzbT0xO2FwcGlkPXl0YWNoeW9u/https://media.zenfs.com/en/time_72/e20d4fbe29a3cca80091ad8dda976c12', // Replace with your step image URL
//                 ),
//                 MeditationStep(
//                   description:
//                       'Focus on Breath: Take a few deep breaths to center yourself, focusing on the inhalation and exhalation.',
//                   imageUrl:
//                       'https://s.yimg.com/uu/api/res/1.2/JPnlrRZ8yrKd71YYY1zGwQ--~B/aD0xNDk0O3c9MjQwMDtzbT0xO2FwcGlkPXl0YWNoeW9u/https://media.zenfs.com/en/time_72/e20d4fbe29a3cca80091ad8dda976c12', // Replace with your step image URL
//                 ),
//                 MeditationStep(
//                   description:
//                       'Chanting: Begin chanting "Ohm" slowly and melodiously, feeling the vibration in your chest and throat. Chant for 5-10 minutes, allowing the sound to calm your mind.',
//                   imageUrl:
//                       'https://s.yimg.com/uu/api/res/1.2/JPnlrRZ8yrKd71YYY1zGwQ--~B/aD0xNDk0O3c9MjQwMDtzbT0xO2FwcGlkPXl0YWNoeW9u/https://media.zenfs.com/en/time_72/e20d4fbe29a3cca80091ad8dda976c12', // Replace with your step image URL
//                 ),
//                 MeditationStep(
//                   description:
//                       'Concentration: Focus entirely on the sound of vibration of"ohm to deepen your meditation"',
//                   imageUrl:
//                       'https://s.yimg.com/uu/api/res/1.2/JPnlrRZ8yrKd71YYY1zGwQ--~B/aD0xNDk0O3c9MjQwMDtzbT0xO2FwcGlkPXl0YWNoeW9u/https://media.zenfs.com/en/time_72/e20d4fbe29a3cca80091ad8dda976c12', // Replace with your step image URL
//                 ),
//                 MeditationStep(
//                   description:
//                       'Closing: Gradually reduce Chanting, returning to deep breathing before opening your eyes',
//                   imageUrl:
//                       'https://s.yimg.com/uu/api/res/1.2/JPnlrRZ8yrKd71YYY1zGwQ--~B/aD0xNDk0O3c9MjQwMDtzbT0xO2FwcGlkPXl0YWNoeW9u/https://media.zenfs.com/en/time_72/e20d4fbe29a3cca80091ad8dda976c12', // Replace with your step image URL
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
