import 'qna.dart';

class Questions {

  var _allQ = <QnA>[
    QnA('Some cats are allergic to humans', false),
    QnA('You are on a mobile', true),
    QnA('This is an app', true),
    QnA('It doesn\'t matter what you choose', true),
    QnA('You will get this question correct', false),
    QnA('This statement is false', false),
  ];

  int totalQ(){
    return _allQ.length;
  }

  String getQ(int idx){
    return _allQ[idx].question;
  }

  bool checkAns(int idx, bool attempt) {
    return _allQ[idx].checkAns(attempt);
  }
}