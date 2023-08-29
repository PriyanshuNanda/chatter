import 'package:flutter/material.dart';
import 'package:chatter/screens/welcome_screen.dart';
import 'package:chatter/screens/login_screen.dart';
import 'package:chatter/screens/registration_screen.dart';
import 'package:chatter/screens/chat_screen.dart';
import 'package:chatter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:const FirebaseOptions(
          appId: 'Your-app-id',
          apiKey: 'YOUR-API-KEY',
          projectId: 'PROJECT-ID',
          messagingSenderId: 'YOUR-MESSAGING-ID',
          storageBucket: 'YOUR-PROJECT-STORAGE-BUCKET',
        ),);

  runApp(const FlashChat());
}

class FlashChat extends StatefulWidget {
  const FlashChat({super.key});
  @override
  State<FlashChat> createState() => _FlashChatState();
}

class _FlashChatState extends State<FlashChat> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.iD,
      routes: {
        WelcomeScreen.iD: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        'chat': (context) => const ChatScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
      },
    );
  }
}
