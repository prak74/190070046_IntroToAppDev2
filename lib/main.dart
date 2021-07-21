import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      home: Scaffold(
        body: Quiz(),
      )
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  
  Questions allQuestions = new Questions();
  int index = 0;
  var score = <Container>[];

  void _attempt(bool attempt){
    setState(() {
      bool correct = allQuestions.checkAns(index, attempt);
      if(correct){
        score.add(new Container(child: Icon(Icons.check, color: Colors.green,),));
        print(score);
      }
      else{
        score.add(new Container(child: Icon(Icons.clear, color: Colors.red,)));
      }
      _updateIndex();
    });
  }

  void _updateIndex(){
    setState(() {
      index++;
      if(index >= allQuestions.totalQ()){
        index = 0;
        score.clear();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Container(
        color: Colors.black87,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Center(
              child: Text(
                '${allQuestions.getQ(index)}',
                // textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: TextButton(
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text('True', style: TextStyle(color: Colors.white, fontSize: 20)),
                )),
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: (){
                  _attempt(true);
                },
              ),
              color: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Card(
              child: TextButton(
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text('False', style: TextStyle(color: Colors.white, fontSize: 20)),
                )),
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: (){
                  _attempt(false);
                },
              ),
            ),
          ),
          if(score.isNotEmpty) SizedBox(
            height: 20,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: score.length,
              itemBuilder: (context,i){
                return score[i];
              },
              shrinkWrap: true,
            ),
          )
        ],
      )
    )
    );
  }
}
