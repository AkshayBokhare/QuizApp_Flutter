import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class StartScreen extends StatelessWidget {
  const StartScreen( this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/quizAppLogo.png", width: 300),
        const SizedBox(height: 30),
         Text(
          "Learn Flutter In Fun Way..!",
          style: GoogleFonts.asap(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),

          ),
          
          
        const SizedBox(height: 40),
        OutlinedButton(
            onPressed: 
              startQuiz,
           
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            child: const Text("Start Quiz",)
            ),
      ],
    ));
  }
}
