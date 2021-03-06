import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_dote/registration/first_screen.dart';
import 'package:study_dote/registration/first_time_verification.dart';
import 'package:study_dote/registration/login.dart';
import 'package:study_dote/common/gradient_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_dote/common/progress_dialog.dart';
import 'package:study_dote/scoped_model/scopedmodel.dart';
import 'package:study_dote/screens/home_screen.dart';
import 'package:study_dote/utils/urls.dart';
import 'package:study_dote/utils/my_prefs.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:universal_widget/universal_widget.dart';

String _email, _password, _name, _phone;

BuildContext _context;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
final Shader linearGradient = LinearGradient(
  colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

UniversalWidget _linear = UniversalWidget(
    visible: false,
    child: LinearProgressIndicator(
        backgroundColor: Colors.deepOrangeAccent,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent)));

Widget _linearProgress = PreferredSize(
    child: _linear, preferredSize: Size(double.infinity, 1.0));

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    _context = context;

    Size _size = MediaQuery.of(context).size;
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, FlipScoppedModel model) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Form(
            key: _formKey,
            child: Scaffold(
              appBar: _getAppBar(),
              bottomNavigationBar: BottomFacebookGoogle(),
              backgroundColor: Colors.white,
              body: ListView(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      _size.width * 0.05,
                      _size.width * 0.001,
                      _size.width * 0.05,
                      _size.width * 0.001),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0,),
                      Text('Signup',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue[300],fontWeight: FontWeight.w900,fontSize: 32.0,),),
                      SizedBox(height: 30.0,),
                      Container(
                        width: _size.width * 0.9,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.length > 3)
                              return null;
                            else
                              return 'Invalid name';
                          },
                          onSaved: (String value) {
                            setState(() {
                              _name = value;
                            });
                          },
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(_size.width * 0.025))),
                            hintText: 'Ex: Mani Chapagai',
                            labelText: 'Full Name',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _size.width * 0.03,
                      ),
                      Container(
                        width: _size.width * 0.9,
                        child: TextFormField(
                          validator: (String email) {
                            if (email.contains('@'))
                              return null;
                            else
                              return 'Invalid e-mail';
                          },
                          onSaved: (String value) {
                            setState(() {
                              _email = value;
                            });
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(_size.width * 0.025))),
                            hintText: 'example@email.com',
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _size.width * 0.03,
                      ),
                      Container(
                        width: _size.width * 0.9,
                        child: TextFormField(
                          validator: (String pass) {
                            if (pass.length > 6)
                              return null;
                            else
                              return 'Password must be 6 characters long';
                          },
                          onSaved: (String value) {
                            setState(() {
                              _password = value;
                            });
                          },
                          keyboardType: TextInputType.text,
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
                        height: _size.width * 0.03,
                      ),
                      Container(
                        width: _size.width * 0.9,
                        child: TextFormField(
                          validator: (String phone) {
                            if (phone.length > 9)
                              return null;
                            else
                              return 'Invalid Phone number';
                          },
                          onSaved: (String value) {
                            setState(() {
                              _phone = value;
                            });
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(_size.width * 0.025)),
                            ),
                            prefixIcon: Icon(Icons.phone),
                            hintText: '+91 9502039079',
                            labelText: 'Phone',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _size.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GradientButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                //_progressDialog.show();
                                //print('name:$_name,phone:$_phone,email:$_email,pass:$_password');
                                _registerUserWithCredentials();
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              }
                            },
                            title: 'Register',
                            width: _size.width * 0.8,
                            height: _size.height * 0.078,
                          ),
                          SizedBox(height: 20.0,)
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }

  Future _registerUserWithCredentials() async {
    _linear.update(visible: true);

    await post(Urls.register,
            body: {'full_name': _name, 'email': _email, 'password': _password})
        .then((response) {
      var result = json.decode(response.body);

      print(response.body);
      _linear.update(visible: false);
      if (result['id'] != null) {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (BuildContext context) => FirstTimeVerification(
                  email: _email,
                  name: _name,
                  pass: _password,
                  jsonS: result.toString(),
                )));
      } else if (result['data'] != null) {
        if (result['errors'] != null) {
          MessageBox(_context, 'Error: ' + result['errors']['email']['msg'].toString(), 'SignUp Failed')
              .show();
        }
      } else {
        print('Can\'t register! Please try later');
        MessageBox(
            _context,
            'We are facing few troubles out there, please try later',
            'SignUp Failed')
            .show();
      }
    });
  }
}

class BottomFacebookGoogle extends StatelessWidget {
  const BottomFacebookGoogle({
    Key key,
  }) : super(key: key);

  //Google Login
  Future<String> _testSignInWithGoogle() async {
    _auth.signOut().whenComplete(() {
      print('signed out successful');
    });
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
//    if (!_progressDialog.isShowing()) _progressDialog.show();
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    print(' signInWithGoogle succeeded : ' +
        " " +
        user.email +
        " " +
        user.displayName +
        " " +
        user.photoUrl +
        " ");

    _name = user.displayName;
    _email = user.email;
    _phone = user.phoneNumber;
    _password = '';

    return 'signInWithGoogle succeeded: $user';
  }

  Future _registerUserWithGmail() async {
    //if (!_progressDialog.isShowing()) _progressDialog.show();
    var response = await post(Urls.register,
        body: {'full_name': _name, 'email': _email, 'password': _password});
    var jsonData = json.decode(response.body);

    print('JSON data : ${jsonData.toString()}\nbody:${response.body}');

    var result = json.decode(response.body);

    if (result['data'] != null) {
      //if (_progressDialog.isShowing()) _progressDialog.hide();
      print(
          'Data:\nName: ${result['data']['full_name']}\nEmail: ${result['data']['email']}\nPassword: ${result['data']['password']}\n');
      if (result['errors'] != null) {
        print('Errors:\nEmail: ${result['errors']['email']['msg']}');
        Future.delayed(Duration(milliseconds: 200)).then((onValue) {
          MessageBox(
                  _context, result['errors']['email']['msg'], 'SignUp Failed')
              .show();
        });
      } else {
        Future.delayed(Duration(milliseconds: 200)).then((onValue) {
          MessageBox(
                  _context,
                  'We are facing few troubles out there, please try later',
                  'SignUp Failed')
              .show();
        });
      }
    } else if (result['id'] != null) {
      print('Id: ${result['id']}\n');
      MyPrefs.setLoginDetails(
              '${result['id']}', '${result['password']}', '${result['email']}')
          .whenComplete(() {
        //if (_progressDialog.isShowing()) _progressDialog.hide();

        Future.delayed(Duration(milliseconds: 500)).then((onValue) {
          Navigator.of(_context).pushReplacement(
              CupertinoPageRoute(builder: (BuildContext context) => Home()));
        });
      });
    } else {
      print('Can\'t register! Please try later');
      //if (_progressDialog.isShowing()) _progressDialog.hide();
      Future.delayed(Duration(milliseconds: 200)).then((onValue) {
        MessageBox(
                _context,
                'We are facing few troubles out there, please try later',
                'SignUp Failed')
            .show();
      });
    }
  }

  Widget _getSignUPLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 70.0,
        ),
        Text(
          'Signup With',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170.0,
      color: Colors.grey.withOpacity(0.3),
      child: Column(
        children: <Widget>[
          _getSignUPLabel(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
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

              ///
              Container(
                height: 50.0,
                child: RaisedButton.icon(
                  onPressed: () {
                    _testSignInWithGoogle();
                  },
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Already have an account?'),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(
                        builder: (BuildContext context) => Login()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 15.0,
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
