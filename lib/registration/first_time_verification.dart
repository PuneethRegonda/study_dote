import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:study_dote/common/progress_dialog.dart';

import 'package:study_dote/registration/signup.dart';
import 'package:study_dote/screens/home_screen.dart';
import 'package:study_dote/utils/my_prefs.dart';
import 'package:study_dote/utils/urls.dart';
import 'package:universal_widget/universal_widget.dart';

String _email, _name, _jsonString, _password;

UniversalWidget _linear = UniversalWidget(
    visible: false,
    child: LinearProgressIndicator(
        backgroundColor: Colors.deepOrangeAccent,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent)));

Widget _linearProgress = PreferredSize(
    child: _linear, preferredSize: Size(double.infinity, 1.0));

class FirstTimeVerification extends StatefulWidget {
  FirstTimeVerification(
      {String email, String name, String jsonS, String pass}) {
    _email = email;
    _name = name;
    _jsonString = jsonS;
    _password = pass;
  }

  @override
  State<StatefulWidget> createState() {
    return _FirstTimeVerificationState();
  }
}

class _FirstTimeVerificationState extends State<FirstTimeVerification> {
  String _code = '';
  var fkey = GlobalKey<FormState>();

  Widget _getAppBar() {
    return AppBar(
      title: Text('Login'),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(5, 193, 154, 1),
      leading: InkWell(
        child: Icon(Icons.keyboard_arrow_left),
        onTap: () {
          Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (BuildContext context) => SignUp()));
        },
      ),
      bottom: _linearProgress,
    );
  }


  Widget _getBody() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 8 / 10,
          child: Center(
            child: Form(
              key: fkey,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '9 digit code',
                ),
                maxLength: 9,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                validator: (String val) {
                  if (val.length != 9) {
                    return 'Invalid OTP';
                  }
                },
                onSaved: (String onVal) async {
                  _code = onVal;
                  await _verifyUser();
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 8 / 10,
          child: CupertinoButton(
            child: Text(
              'Submit',
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              if (fkey.currentState.validate()) fkey.currentState.save();
            },
            color: Colors.blue,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        InkWell(
          child: Text('Didn\'t recieve email, click here to resend'),
          onTap: () {
            _resendMail();
          },
        )
      ],
    );
  }

  Future _resendMail() async {
    _linear.update(visible: true);
    var response = await get(Urls.resendCode + '?email=$_email');
    var jsonData = json.decode(response.body);

    print(jsonData);
    _linear.update(visible: false);
    if(jsonData['message'].toString().contains('success')){
      new MessageBox(context, 'Verification code has been resent to your mail', 'Success').show();
    }else if (jsonData['message'].toString().contains('Student already verified')) {
      new MessageBox(context, 'You are already verified, click ok to go to login page', 'OOPS!').show();
    }else{
      new MessageBox(context, 'Something has gone wrong, please try later', 'Error').show();
    }

    /*
    {message: Student already verified}
    {message: success}
     */

  }

  Future _verifyUser() async {
    _linear.update(visible: true);

    var response = await get(Urls.verifyUser + '?code=$_code');
    var jsonData = json.decode(response.body);

    print(jsonData);

    if(jsonData['success']!=null){
      _makeLoginRequest();
    }else{
      _linear.update(visible: false);
      new MessageBox(context, 'Sorry your login credentials are incorrect, please try again', 'Error').show();
    }
    /*
    {error: Not authorized}
    {success: OK}
     */
  }

  Future _makeLoginRequest() async {
    print('Making login request with $_email' + '$_password');
    Map<String,String> headers = {'Content-Type':'application/json','Accept': 'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};
    var response = await post(Urls.getToken,
      headers: headers,
      body: jsonEncode({"grant_type":"password","username":_email,"password":_password,"scope":"offline_access"}),
    );
    var jsonData = jsonDecode(response.body);
    _linear.update(visible: false);
    if(jsonData['access_token']!=null){
      MyPrefs.setTokenLoginDetails('', _password, _email, jsonData['access_token'],jsonData['refresh_token']);
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (BuildContext context) => Home()));
    } else{
      new MessageBox(context, 'Sorry your login credentials are incorrect, please try again', 'Error').show();
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: Center(child: _getBody(),),
      ),
    );
  }
}
