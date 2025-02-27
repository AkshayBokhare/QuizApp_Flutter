import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;

final void Function() onRestart;
 List<Map<String,Object>> getSummaryData(){

    final List<Map<String, Object>> summary = [];

    for(var i=0; i < chosenAnswers.length; i++  ){
          summary.add({
              "question_index" : i,
              "question":questions[i].text,
              "correct_answer":questions[i].answers[0],
              "user_answer":chosenAnswers[i]
          });
    }

    return summary;
  }


  @override
  Widget build(BuildContext context) {
    final summeryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summeryData.where((data){
      return data["user_answer"] == data["correct_answer"] ;
    }).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

             Text("You answered $numCorrectQuestions out of $numTotalQuestions questions Correctly!",
               style: GoogleFonts.lato(
                color: Color.fromARGB(255, 1, 38, 45),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          
            const SizedBox(height: 40),

            QuestionsSummary(summeryData),

            const  SizedBox(height: 40),
          
             TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ) ,
              icon: const Icon(Icons.refresh),
              label:Text("Restart Quiz"),
              
              ),
             
          ],
        ),
      ),
    );
  }

  
}