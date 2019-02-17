import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FlashCardSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlashCardState();
  }
}

class _FlashCardState extends State<FlashCardSample> {
  List<int> indexes = [1, 2, 3, 4, 5];
  List<String> values = ['English', 'Telugu', 'Maths', 'Science', 'Social'];
  List<bool> selected = [false, false, false, false, false];

  String _subjectIds = '';

  int screen_to_show = 0;

  Widget _getAppBar() {
    return AppBar(
      title: Text('Flash Cards'),
      centerTitle: true,
    );
  }

  Widget _getBody() {
    switch (screen_to_show) {
      case 0:
        return _letUserSelectTopics();
      case 1:
        return _seeFlashCards();
      default:
        return Container();
    }
  }

  Widget _letUserSelectTopics() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 8 / 10,
              child: ListView.builder(
                  itemCount: indexes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 9 / 10,
                        height: 50.0,
                        child: CheckboxListTile(
                          value: selected[index],
                          title: Text('${values[index]}'),
                          selected: selected[index],
                          onChanged: (bool isChecked) {
                            setState(() {
                              selected[index] = isChecked;
                            });
                            checkBoxSelectionChange(isChecked, index);
                          },
                        ),
                      ),
                    );
                  }),
            )),
        Center(
          child: RaisedButton(
            onPressed: () {},
            child: SizedBox(
              height: 50.0,
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
        ),
        SizedBox(height: 10.0,)
      ],
    );

    /*
    FutureBuilder(
          future: _getTopics(),
          builder: (BuildContext context, snapshot) {
            return ListView.builder(
                itemCount: indexes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 9 / 10,
                      height: 50.0,
                      child: CheckboxListTile(
                        value: false,
                        title: Text('${values[index]}'),
                        selected: false,
                        onChanged: (bool isChecked) {
                          checkBoxSelectionChange(isChecked, index);
                        },
                      ),
                    ),
                  );
                });
          })
    */
  }

  Widget _seeFlashCards() {
    return SingleChildScrollView();
  }
  //Processing methods
  void checkBoxSelectionChange(bool isChecked, int index) {
    _subjectIds = '';
    for (int i = 0; i < values.length; i++) {
      if (selected[i]) {
        if (_subjectIds.isEmpty)
          _subjectIds += '${values[i]}:${indexes[i]}';
        else
          _subjectIds += ',${values[i]}:${indexes[i]}';
      }
    }
    print('the string is $_subjectIds');
  }

  //Futures
  Future<bool> _getTopics() async {
    indexes = [1, 2, 3, 4, 5];
    values = ['English', 'Telugu', 'Maths', 'Science', 'Social'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }
}
