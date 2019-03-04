import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:study_dote/common/progress_dialog.dart';
import 'package:study_dote/registration/signup.dart';
import 'package:study_dote/utils/urls.dart';

String _email, _name, _jsonString, _password;
ProgressDialog _pr;

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
      title: Text('Verify your identity'),
      centerTitle: true,
      leading: InkWell(
        child: Icon(Icons.arrow_back),
        onTap: () {
          Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (BuildContext context) => SignUp()));
        },
      ),
    );
  }

  Widget _getBody() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 6 / 10,
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
                validator: (String val) {
                  if (val.length != 9) {
                    return 'Invalid OTP';
                  }
                },
                onSaved: (String onVal) {
                  _code = onVal;
                  _pr.show();
                  _verifyUser();
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        CupertinoButton(
          child: SizedBox(
            height: MediaQuery.of(context).size.width*9/10,
            child: Text('Submit'),
          ),
          onPressed: () {
            if(fkey.currentState.validate())
              fkey.currentState.save();

          },
          color: Colors.blue,
        ),
        SizedBox(
          height: 20.0,
        ),
        InkWell(
          child: Text('Didn\'t recieve email, click here to resend'),
          onTap: (){
            _pr.show();
            _resendMail();
          },
        )
      ],
    );
  }

  Future _resendMail() async {

    var response = await get(Urls.resendCode+'?email=$_email');
    var jsonData = json.decode(response.body);

    print(jsonData);

    _pr.hide();
  }


  Future _verifyUser() async {

    var response = await get(Urls.verifyUser+'?code=$_code');
    var jsonData = json.decode(response.body);

    print(jsonData);

    _pr.hide();
  }

  @override
  Widget build(BuildContext context) {
    _pr = new ProgressDialog(context);
    _pr.setMessage('Verifying...');

    return Scaffold(
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: _getBody(),
      ),
    );
  }
}
