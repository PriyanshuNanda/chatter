import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:chatter/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = 'login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth=FirebaseAuth.instance;
  bool spin=false;
  late  String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall:spin ,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email=value;
                },
                decoration:kTextStyle.copyWith(hintText: 'Enter your email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password=value;
                },
                decoration: kTextStyle.copyWith(hintText:'Enter your password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                    elevation: 5.0,
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      minWidth: 200.0,
                      height: 42.0,
                      onPressed: ()async {
                        setState(() {
                          spin=true;
                        });
                        try{
                          final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
                          if(user!=null){
                            if(mounted){
                              Navigator.pushNamed(context, 'chat');}
                            setState(() {
                              spin=false;
                            });
                          }
                          else{
                            const AlertDialog(title: Text("Error"),);
                            setState(() {
                              spin=false;
                            });
                          }
                        }
                        catch(e){
                          AlertDialog(title: Text('Error $e',style: const TextStyle(color: Colors.white),),);
                        }
                      },
                      child: const Text('Log In',style: TextStyle(color: Colors.white),),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


