// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// // import 'package:alan_voice/alan_voice.dart';

// class VoiceAssistant extends StatefulWidget {
//   const VoiceAssistant({super.key});

//   @override
//   State<VoiceAssistant> createState() => _VoiceAssistantState();
// }

// class _VoiceAssistantState extends State<VoiceAssistant> {
//   @override
//   void initState() {
//     super.initState();
//     initAlan();
//   }

//   // void initAlan() {
//   //   AlanVoice.addButton(
//   //       "53804a82fae46024f3ad2514af2750542e956eca572e1d8b807a3e2338fdd0dc/stage",
//   //       buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);
//   //   AlanVoice.onCommand.add((command) {
//   //     debugPrint("got new command ${command.toString()}");
//   //   });
//   // }

//   // _VoiceAssistantState() {
//   //   /// Init Alan Button with project key from Alan AI Studio
//   //   AlanVoice.addButton(
//   //       "53804a82fae46024f3ad2514af2750542e956eca572e1d8b807a3e2338fdd0dc/stage",
//   //       buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

//   //   /// Handle commands from Alan AI Studio
//   //   AlanVoice.onCommand.add((command) {
//   //     debugPrint("got new command ${command.toString()}");
//   //   });
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           // Start Alan AI when this button is pressed
//           initAlan();
//         },
//         child: Text('Start Alan AI'),
//       ),
//     );
//   }
// }
