import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:study_dote/common/progress_dialog.dart';

import 'package:study_dote/registration/first_screen.dart';
import 'package:study_dote/registration/reset_password.dart';
import 'package:study_dote/registration/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:study_dote/common/gradient_button.dart';
import 'package:study_dote/scoped_model/scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:study_dote/screens/home_screen.dart';
import 'package:study_dote/utils/urls.dart';
import 'package:study_dote/utils/my_prefs.dart';
import 'package:universal_widget/universal_widget.dart';

String _email,_password;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

bool _iNeedPassword = true;

bool _shallIShowLinearBar = false;

UniversalWidget _linear = UniversalWidget(
    visible: _shallIShowLinearBar,
    child: LinearProgressIndicator(
        backgroundColor: Colors.deepOrangeAccent,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent)));

Widget _linearProgress = PreferredSize(
    child: _linear, preferredSize: Size(double.infinity, 1.0));


final Shader linearGradient = LinearGradient(
  colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: _getLoginForm(),
    );
  }

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

  Widget _getLoginForm() {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, FlipScoppedModel model) {
        return Form(
          key: _formKey,
          child: Scaffold(
            appBar: _getAppBar(),
            bottomNavigationBar: BottomFacebookGoogle(),
            backgroundColor: Colors.white,
            body: ListView(children: [
              Container(
                margin: EdgeInsets.fromLTRB(_size.width * 0.05,
                    _size.width * 0.05, _size.width * 0.05, _size.width * 0.01),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0,),
                    Text('Login',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue[300],fontWeight: FontWeight.w900,fontSize: 32.0,),),
                    SizedBox(height: 30.0,),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 15.0,),
                        Container(
                          width: _size.width * 0.8,
                          child: TextFormField(
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
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(_size.width * 0.025))),
                              hintText: 'Email',
                              labelText: 'example@email.com',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: _size.width * 0.03,
                        ),
                        Container(
                          width: _size.width * 0.8,
                          child: TextFormField(
                            validator: (String pass) {
                              if(_iNeedPassword) {
                                if (pass.length > 6)
                                  return null;
                                else
                                  return 'Password must be 6 characters long';
                              }
                              else
                                return null;
                            },
                            onSaved: (String value) {
                              setState(() {
                                _password = value;
                              });
                            },
                            obscureText: !model.passwordstatus,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  icon: model.passwordstatus
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                  onPressed: () {
                                    return model.ispasswordstatus();
                                  }),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(_size.width * 0.025)),
                              ),
                              hintText: 'Password',
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: _size.width * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GradientButton(
                              onPressed: () {
                                _iNeedPassword = true;
                                if (_formKey.currentState.validate()) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  _formKey.currentState.save();
                                  _makeLoginRequest();
                                }
                              },
                              title: 'Login',
                              width: _size.width * 0.8,
                              height: 54.0,
                            ),
                          ],
                        ),
                        FlatButton(onPressed: (){
                          Navigator.of(context).pushReplacement(CupertinoPageRoute(
                              builder: (BuildContext context) => ResetPassword()));
                        }, child: Text('Forgot password, reset here')),
                      ],
                    ),
                  ],
                ),
              ),//              color: Colors.blue,
            ]),
          ),
        );
      },
    );
  }



  /*
  {"access_token":"DQAnZaXoBkSK7ALxS2ESnuPEK3ybEGVCuq3ptIAYhPg16l9rT9jfNOAOQhLGQuSu3xt0j1lwa4T0u0YKDdo2eKw5xNvwS8YEf5yXmjSPsM0C2swHCcM7SVXvJj23bUrJx5xMBFOjCSGCwhLc8P3d6QB8ZfY0yQBUOSESsVvD3QyV9Fjm48kKHmRBT2JLesxILn2SItVSGEtxjYYAYqDamfRPdYlGnTnysGpsRHJTndrGeWqY5zRDbgBk3Hc6owh",
  "refresh_token":"LVuMupFJ4OSVav0dQzAmcNE9NrqULrNRWoiCxn0SueaA4eiftILhgWUXW0X4zXkCdPz9TeISyRPhZBlxaYR5p3AEBVGuwy5TzReLW43tou3eCfhwtIVaooWAjsvh7aKQf5hpHYIXYh0QMaUbpBpljBc3yBOB3DKvg713sRwGv65OagcBvMgYsbaDxNXeLfF16UEBqr3py1mm6uwvIhSiWLIx5fZ0GHg0zKHKgtS8BzATwKrIYTtm3ngGdO2FiHO",
  "token_type":"Bearer"}
   */

  Future _makeLoginRequest() async {
    setState(() {
      _shallIShowLinearBar = true;
    });

    print('Making login request with $_email' + '$_password');

    Map<String,String> headers = {'Content-Type':'application/json','Accept': 'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};

    var response = await post(Urls.getToken,
      headers: headers,
      body: jsonEncode({"grant_type":"password","username":_email,"password":_password,"scope":"offline_access"}),
    );

    print(response.body);

    var jsonData = jsonDecode(response.body);
    setState(() {
      _shallIShowLinearBar = false;
    });

    if(jsonData['access_token']!=null){
      MyPrefs.setTokenLoginDetails('', _password, _email, jsonData['access_token'],jsonData['refresh_token']);
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (BuildContext context) => Home()));
    } else{
      new MessageBox(context, 'Sorry your login credentials are incorrect, please try again', 'Error').show();
    }
  }
}

class BottomFacebookGoogle extends StatelessWidget {
  const BottomFacebookGoogle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 156.0,
      color: Colors.grey.withOpacity(0.3),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Text(
                'Login With',
                style: TextStyle(
                  fontSize: 20.0,
                  foreground: Paint()..shader = linearGradient,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 50.0,
                child: RaisedButton.icon(
                  onPressed: () {},
                  icon: Image(image: AssetImage('assets/google_plus.png')),
                  label: Text(
                    'Google+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  color: Color.fromRGBO(220, 78, 66, 1),
                ),
              ),
              Container(
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: RaisedButton.icon(
                  onPressed: () {},
                  icon: Image(image: AssetImage('assets/facebook.png')),
                  label: Text(
                    'Facebook',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Color.fromRGBO(58, 89, 152, 1),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Don\'t have an account?  '),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SignUp()));
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 15.0,
//                        color: Colors.black,
                      foreground: Paint()..shader = linearGradient,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
