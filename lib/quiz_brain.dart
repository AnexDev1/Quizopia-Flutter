import 'package:quizopia/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('አትላንቲክ ውቅያኖስ በምድር ላይ ትልቁ ውቅያኖስ ነው', false),
    Question('ጉንዳን የሰውነቱን ክብደት 1,000 እጥፍ ማንሳት ይችላል', false),
    Question('ደቡብ አፍሪካ አንድ ዋና ከተማ አላት', false),
    Question('የኤቨረስት ተራራ የዓለማችን ረጅሙ ተራራ ነው', true),
    Question('የታላቁ የቻይና ግንብ አጠቃላይ ርዝመት 13,171 ማይል ከፍታ አለዉ', true),
    Question('ግሪንላንድ በዓለም ላይ ትልቁ ደሴት ነው', true),
    Question('ቫቲካን ከተማ በዓለም ላይ ትንሹ ሀገር ነች', true),
    Question('ሕፃናት ከአዋቂዎች የበለጠ አጥንቶች አሏቸው', true),
    Question('ልብ በሰውነት ውስጥ ትልቁ የውስጥ አካል ነው', false),
    Question('አብዛኛው የሰው አንጎል በጡንቻ የተሠራ ነው', false),
    Question('የሰው ዓይን 10 ሚሊዮን የተለያዩ ቀለሞችን መለየት ይችላል', true),
    Question('አናናስ በዛፎች ላይ ይበቅላል', false),
    Question('ብራዚል በእያንዳንዱ የዓለም ዋንጫ የፍጻሜ ውድድር የተጫወተች ብቸኛ ሀገር ነች', true),
    Question('የሰው አካል 60% ውሃ ነው', true),
    Question('ቬንዙዌላ የዓለም ከፍተኛው ፏፏቴ መኖሪያ ናት', true)
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  int getQuestionBankLength() {
    return _questionBank.length;
  }
}
