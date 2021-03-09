import './questions.dart';

class Bank {
  int _questionNumber = 0;

  List<Questions> _questionBank = [
    Questions('Some cats are actually allergic to humans', true),
    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions(
        'Approximately one quarter of human bones are in the feet.', true),
    Questions('A slug\'s blood is green.', true),
    Questions('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Questions('It is illegal to pee in the Ocean in Portugal.', true),
    Questions(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Questions(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Questions(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Questions(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() =>
      _questionNumber >= _questionBank.length - 1 ? true : false;

  void reset() => _questionNumber = 0;
  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].questionsAnswer;
  }
}
