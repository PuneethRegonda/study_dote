import 'package:flutter/material.dart';
import 'package:study_dote/home.dart';
import 'package:study_dote/registration/signup.dart';

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
  String _userName;
  String _password;
  bool _acceptterms = false;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          bottomNavigationBar:  BottomFacebookGoogle(),
          backgroundColor: Colors.white,
          body: ListView(children: [
            Container(
//              width: 220.0,
              margin: EdgeInsets.fromLTRB(_size.width*0.05, _size.width*0.05, _size.width*0.05, _size.width*0.01),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(_size.width*0.03, _size.height*0.1, _size.width*0.03, _size.height*0.1),
                    child: Center(
                      child: Text('Login',
                        style: new TextStyle(
                            fontSize: _size.width*0.08,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = linearGradient),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: _size.width*0.8,

                        child: TextFormField(
                          validator: (String value){
                            if(value.contains('@'))
                              return null;
                            else
                              return 'Invalid E-mail address';
                          },
                          onSaved: (String value) {
                            setState(() {
                              _userName = value;
                            });
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(_size.width*0.025))),
                            hintText: 'UserName',
                            labelText: 'UserName',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _size.width*0.03,
                      ),
                      Container(
                        width: _size.width*0.8,
                        child: TextFormField(
                          validator: (String pass){
                            if(pass.length > 6)
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(_size.width*0.025))),
                            hintText: 'Password',
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _size.width*0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                        GradientButton(
                          onPressed: () {
                            print(_size.height*0.078);
                            FocusScope.of(context)
                                .requestFocus(FocusNode());
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>Home()));

//                            if (_formKey.currentState.validate() &&
//                                _acceptterms == true) {
//                              _formKey.currentState.save();
//                              print(
//                                  '$_acceptterms,usr:$_userName,pass:$_password');
////                              Navigator.pushReplacementNamed(context, '/products');
//                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Home()));
//                              FocusScope.of(context)
//                                  .requestFocus(FocusNode());
//
//                            }
                          },
                            title: 'Login',
                          width: _size.width*0.8,
                          height:53.307428571428574,
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
      ),
    );
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
                  icon: Image(image: AssetImage('assets/google-plus.png')),
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
                  icon: Image(image: AssetImage('assets/facebook .png')),
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
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SignUp()));
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

class GradientButton extends StatelessWidget {

  const GradientButton({
    Key key,
    @required this.onPressed,
    @required this.title,
    @required this.width,
    @required this.height
  }) : super(key: key);

  final  Function onPressed;
  final String title;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: Color.fromRGBO(5, 193, 154, 1),
      onPressed: onPressed,
      child: Container(
        child: Center(child:
        Text(title,style: TextStyle(
            fontSize: 20.0,
            color: Colors.white
        ),)),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          shape: BoxShape.rectangle,
          gradient: new LinearGradient(
            colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
          ),
        ),

      ),
    );
  }
}
