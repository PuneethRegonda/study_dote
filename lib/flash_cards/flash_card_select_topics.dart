import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:study_dote/common/progress_dialog.dart';
import 'package:study_dote/common/progress_men.dart';
import 'package:study_dote/data_models/flash_card.dart';
import 'package:study_dote/data_models/subjects.dart';
import 'package:study_dote/flash_cards/flash_main.dart';
import 'package:study_dote/loaded_data/loaded_data.dart';
import 'package:study_dote/utils/urls.dart';
import 'package:study_dote/utils/api_requests.dart';
import 'package:study_dote/utils/my_prefs.dart';
import 'package:universal_widget/universal_widget.dart';
import 'package:html/parser.dart';

List<SubjectsDM> _subjects = [];
List<FlashCardDM>  _flashCards = [];

UniversalWidget _linear = UniversalWidget(
    child: LinearProgressIndicator(
        backgroundColor: Colors.deepOrangeAccent,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent)));

Widget _linearProgress = PreferredSize(
    child: _linear, preferredSize: Size(double.infinity, 1.0));

class LetsFlashCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlashCardState();
  }
}

class _FlashCardState extends State<LetsFlashCard> {
  List<bool> _isSubjectSelected = [];

  _FlashCardState(){
    _getSubjectsFromServer();
  }

  String _selectedSubjectsString = '';

  int screen_to_show = 0;
  bool somethingChanged = false;

  Widget _getAppBar() {
    return AppBar(
      title: Text('Select the subjects'),
      centerTitle: true,
      leading: InkWell(
        child: Icon(Icons.arrow_back),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      bottom: _linearProgress,
    );
  }


  Widget _getBody() {
     return FutureBuilder(
         future: _getSubjectsFromServer(),
         builder: (BuildContext context, AsyncSnapshot<List<SubjectsDM>> snapshot) {

           if (snapshot.connectionState == ConnectionState.active ||
               snapshot.connectionState == ConnectionState.done) {
             if (snapshot.hasData) {
               return _getTheCheckBoxes();
             } else if (snapshot.hasError) {
               return ShowProgressMen.errorRetrievingDataText;
             } else {
               return ShowProgressMen.centerProgress;
             }
           } else if (snapshot.connectionState == ConnectionState.waiting) {
             if (snapshot.hasData) {
               return _getTheCheckBoxes();
             } else if (snapshot.hasError) {
               return ShowProgressMen.errorRetrievingDataText;
             } else {
               return ShowProgressMen.centerProgress;
             }
           } else if (snapshot.connectionState == ConnectionState.none) {
             return ShowProgressMen.noInternetText;
           } else
             return ShowProgressMen.errorRetrievingDataText;
         }
     );
  }

  static bool isDataLoaded = false;

  Widget _getTheCheckBoxes() {
    if(isDataLoaded) {
//      setState(() {
//        _shallIShowLinearBar = false;
//      });
      _linear.update(visible: false);
      return ListView.builder(
          itemCount: _subjects.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 9.5 / 10,
                height: 50.0,
                child: CheckboxListTile(
                  value: _isSubjectSelected[index],
                  title: Text('${_subjects[index].subName}'),
                  selected: _isSubjectSelected[index],
                  onChanged: (bool isChecked) {
                    setState(() {
                      _isSubjectSelected[index] = isChecked;
                    //  print('$index $isChecked');
                    });
                  },
                ),
              ),
            );
          });
    }else{
      return Container();
    }
  }

  //Processing methods
  void checkBoxSelectionChange() {
    _linear.update(visible: true);
    _selectedSubjectsString = '';
    for (int i = 0; i < _subjects.length; i++) {
      if (_isSubjectSelected[i]) {
        if (_selectedSubjectsString.isEmpty)
          _selectedSubjectsString += '${_subjects[i].id}';
        else
          _selectedSubjectsString += ',${_subjects[i].id}';
      }
    }
    print('the string is $_selectedSubjectsString');
    _fetchCards();
  }


  Future _fetchCards() async {
    _flashCards = [];

    int limit=20,offset=20,cardType=12;


    MyPrefs.getToken().then((String token) async {
      var response = await get(Urls.getFlashCards+'?limit=$limit&offset=$offset&subjects=$_selectedSubjectsString&cardType=$cardType',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },);
      print(response.body);
      if (response.body.contains('Unauthorized')) {
        ApiRequest.getAuthTokenAgain().then((String onValue) {
          _fetchCards();
        });
      } else {
        var jsonData = json.decode(response.body);
        for (var p in jsonData) {

          //String question = p['questions'].toString().substring(3, p['questions'].toString().length-4);

          //String answer = p['answer'].toString().substring(3, p['answer'].toString().length-4);

          FlashCardDM subject = FlashCardDM(
              id: p['id'],
              subjectId: p['subject_id'],
              headerTitle: p['header_title'],
              question: p['questions'],
              answer: p['answer'],
              answerPlain: p['answer_plain'],
              questionPlain: p['questions_plain']
          );
          //   print('${subject.id} \n');
          _flashCards.add(subject);
        }
        LoadedData.flashCards = _flashCards;
        _linear.update(visible: false);
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (BuildContext context) => FlashCards()));
      }
    });
  }

  //Futures
  Future<List<SubjectsDM>> _getSubjectsFromServer() async {
    _subjects = [];
    MyPrefs.getToken().then((String token) async {
      var response = await get('https://api.studydote.com/subject',headers: {'accept': 'application/json',
        'Authorization':'Bearer $token'},);
      print(response.body);
      if(response.body.contains('Unauthorized')){
        ApiRequest.getAuthTokenAgain().then((String onValue){
          _getSubjectsFromServer();
        });
      }else {
        var jsonData = json.decode(response.body);
        for (var p in jsonData) {
          _isSubjectSelected.add(false);
          SubjectsDM subject = SubjectsDM(
              id: p['id'],
              subName: p['subject_name']);
          _subjects.add(subject);
        }
      }
      setState(() {isDataLoaded = true;});
      return _subjects;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _getAppBar(),
      body: _getTheCheckBoxes(),
      bottomNavigationBar:RaisedButton(
          onPressed: () {
            checkBoxSelectionChange();
          },
          child: SizedBox(
            height: 55.0,
            child: Center(
              child: Text(
                'Continue',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontSize: 18.0),
              ),
            ),
            width: MediaQuery.of(context).size.width * 8 / 10,
          ),
          color: Colors.blue,
        ),
    );
  }
}
