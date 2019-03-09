class FlashCardDM{
  int id,subjectId;
  String headerTitle,question,answer,questionPlain,answerPlain;

  FlashCardDM({this.id, this.subjectId, this.headerTitle, this.question,
      this.answer,this.answerPlain,this.questionPlain});
}
/*
 {
  "id":82,
  "subject_id":9,
  "header_title":"GLYCOLYSIS",
  "questions":"<p>Mature RBC lacks enzymes of</p>",
  "answer":"<p>TCA cycle</p>",
  "questions_plain":"Mature RBC lacks enzymes of",
  "answer_plain":"TCA cycle"
  }
*/