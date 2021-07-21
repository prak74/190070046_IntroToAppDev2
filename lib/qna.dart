class QnA {

  late final String question;
  late final bool _answer;

  QnA(this.question, this._answer);

  bool checkAns(bool attempt){
    return attempt == _answer;
  }
}