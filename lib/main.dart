import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseseries/auth/providers.dart';
import 'package:firebaseseries/firebase_options.dart';
import 'package:firebaseseries/screen/onboardingscreens/onboarding1.dart';
import 'package:firebaseseries/screen/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignupProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // Ensure autoLogin is called when the app starts
    Provider.of<SignupProvider>(context, listen: false).autoLogin();
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Signup App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Consumer<SignupProvider>(
        builder: (context, signupProvider, _) {
          // Show home screen if logged in, otherwise show onboarding screen
          return signupProvider.isLoggedIn
              ? const MeditationHomeScreen()
              : const Onboarding1();
        },
      ),
    );
  }
}
