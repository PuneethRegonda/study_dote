import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:study_dote/common/progress_dialog.dart';
import 'package:study_dote/registration/first_screen.dart';
import 'package:study_dote/utils/urls.dart';
import 'package:universal_widget/universal_widget.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResetPasswordState();
  }
}

UniversalWidget _linear = UniversalWidget(
    visible: false,
    child: LinearProgressIndicator(
        backgroundColor: Colors.deepOrangeAccent,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent)));

Widget _linearProgress =
    PreferredSize(child: _linear, preferredSize: Size(double.infinity, 1.0));

String _email = '';

class _ResetPasswordState extends State<ResetPassword> {
  var _formKey = GlobalKey<FormState>();

  Widget _getAppBar() {
    return AppBar(
      title: Text('Study Dote'),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(5, 193, 154, 1),
      leading: InkWell(
        child: Icon(Icons.keyboard_arrow_left),
        onTap: () {
          Navigator.of(context).pushReplacement(CupertinoPageRoute(
              builder: (BuildContext context) => FirstScreen()));
        },
      ),
      bottom: _linearProgress,
    );
  }

  Widget _getForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Reset Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue[300],
                fontWeight: FontWeight.w900,
                fontSize: 24.0,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              validator: (String value) {
                if (value.contains('@'))
                  return null;
                else
                  return 'Invalid E-mail address';
              },
              onSaved: (String value) {
                setState(() {
                  _email = value;
                });
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                hintText: 'Email',
                labelText: 'example@email.com',
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            CupertinoButton(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.blue,
                child: Text('Send Code'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _forgotPassword();
                  }
                })
          ],
        ));
  }

  Future _forgotPassword() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'accept': 'application/json'
    };

    _linear.update(visible: true);
    var response = await post(
      Urls.forgotPassword,
      headers: headers,
      body: jsonEncode({
        "email": _email,
      }),
    );
    print(response.body);
    var jsonData = jsonDecode(response.body);
    _linear.update(visible: false);

    if (jsonData['success'] != null) {
//      new MessageBox(
//              context,
//              'You will recieve an email with password reset link',
//              'Reset link sent')
//          .show();
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (BuildContext context) => _EnterCode()));
    } else if (jsonData['message'] != null) {
      new MessageBox(context, 'Email does not exists', 'Invalid Email').show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 8 / 10,
          child: _getForm(),
        ),
      ),
    );
  }
}

class _EnterCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EnterCodeState();
  }
}

class _EnterCodeState extends State<_EnterCode> {
  var _formKey = GlobalKey<FormState>();

  String _code = '';

  Widget _getAppBar() {
    return AppBar(
      title: Text('Study Dote'),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(5, 193, 154, 1),
      leading: InkWell(
        child: Icon(Icons.keyboard_arrow_left),
        onTap: () {
          Navigator.of(context).pushReplacement(CupertinoPageRoute(
              builder: (BuildContext context) => FirstScreen()));
        },
      ),
      bottom: _linearProgress,
    );
  }

  Widget _getForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Enter the code you have recieved in your email',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue[300],
              fontWeight: FontWeight.w900,
              fontSize: 24.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          TextFormField(
            validator: (String value) {
              if (value.length!=6)
                return null;
              else
                return 'Invalid Code';
            },
            onSaved: (String value) {
              setState(() {
                _code = value;
              });
            },
            maxLength: 6,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.confirmation_number),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              hintText: 'Enter the Code',
              labelText: 'Ex: 123456',
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          CupertinoButton(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.blue,
              child: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  //_forgotPassword();
                }
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 8 / 10,
          child: _getForm(),
        ),
      ),
    );
  }
}
