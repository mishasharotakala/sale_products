import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  
  final _emailController = TextEditingController();

  @override 
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(
            email: _emailController.text.trim(),
      );
      showDialog(
        context: context, 
        builder: (context) {
          return const AlertDialog(
            content: Text("Password reset link sent! Check your email."),
          );
        }
      );
    } on FirebaseAuthException catch(e) {
      print(e);
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Enter your email and we'll send you a password reset link ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          const SizedBox(height: 10,),

          // email textfield
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          MaterialButton(
            onPressed: passwordReset,
            child: Text("Reset Password"),
            color: Colors.deepPurple[200],
          ),
        ],
      ),
    );
  }
}