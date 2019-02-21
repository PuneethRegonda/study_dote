import 'package:flutter/material.dart';
import 'package:study_dote/registration/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:study_dote/common/gradient_button.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

final Shader linearGradient = LinearGradient(
  colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email= '', _password='';
  bool _acceptterms = false;
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

  Widget _getLoginForm() {
    return Form(
      key: _formKey,
      child: Scaffold(
        bottomNavigationBar: BottomFacebookGoogle(),
        backgroundColor: Colors.white,
        body: ListView(children: [
          Container(
            margin: EdgeInsets.fromLTRB(_size.width * 0.05, _size.width * 0.05,
                _size.width * 0.05, _size.width * 0.01),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(
                      _size.width * 0.03,
                      _size.height * 0.1,
                      _size.width * 0.03,
                      _size.height * 0.1),
                  child: Center(
                    child: Text(
                      'Login',
                      style: new TextStyle(
                          fontSize: _size.width * 0.08,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
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
                          labelText: 'ex@email.com',
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
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(_size.width * 0.025))),
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
//                            print(_size.height * 0.078);
                            if(_formKey.currentState.validate()) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              _formKey.currentState.save();
                              _makeLoginRequest();
//                                if(value)
//                                  Navigator.of(context).pushReplacement(
//                                      CupertinoPageRoute(
//                                          builder: (BuildContext context) => Home()));
//                                else
//                                  print('error');

                            }
                          },
                          title: 'Login',
                          width: _size.width * 0.8,
                          height: 54.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
//              color: Colors.blue,
          ),
        ]),
      ),
    );
  }

  Future _makeLoginRequest(){
    print('$_email' + '$_password');
    //return true;
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
//                    mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Text(
                'Login With',
                style: TextStyle(
                  fontSize: 20.0,
//                        color: Colors.black,
                  foreground: Paint()..shader = linearGradient,
                ),
              )
            ],
          ),
//                  SizedBox(
//                    height: 30.0,
//                  ),
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

              ///
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
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SignUp()));
                  },
                  child: Text(
                    'Signup With',
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
