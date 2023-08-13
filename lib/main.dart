import 'package:flutter/material.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flashchat/screens/chat_screen.dart';

void main() {
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
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.iD,
      routes:{
        WelcomeScreen.iD: (context) => const WelcomeScreen(),
        'login':(context)=> const LoginScreen(),
        'chat':(context)=>const ChatScreen(),
        'registration':(context)=>const RegistrationScreen(),
      } ,
    );
  }
}


