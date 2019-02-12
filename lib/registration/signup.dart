import 'package:flutter/material.dart';
import 'package:study_dote/registration/login.dart';
import 'package:study_dote/common/gradient_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

final Shader linearGradient = LinearGradient(
  colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
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
          bottomNavigationBar: BottomFacebookGoogle(),
          backgroundColor: Colors.white,
          body: ListView(
            children: [
          Container(
            margin: EdgeInsets.fromLTRB(_size.width * 0.05,
                _size.width * 0.001, _size.width * 0.05, _size.width * 0.001),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(
                      _size.width * 0.03,
                      _size.height * 0.04,
                      _size.width * 0.03,
                      _size.height * 0.07,
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: new TextStyle(
                          fontSize: _size.width * 0.08,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient),
                    ),
                  ),
                ),
                Container(
                  width: _size.width * 0.9,
                  child: TextFormField(
                    validator:  (String value){
                      if(value.contains('@'))
                        return null;
                      else
                        return 'Invalid E-mail address';
                    },
                    onSaved: (String value) {
                      setState(() {
                        _email = value;
                      });
                    },
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(_size.width * 0.025))),
                      hintText: 'FullName',
                      labelText: 'FullName',
                    ),
                  ),
                ),
                SizedBox(
                  height: _size.width * 0.03,
                ),
                Container(
                  width: _size.width * 0.9,
                  child: TextFormField(
                    validator:(String pass){
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
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(_size.width * 0.025))),
                      hintText: 'ex@email.com',
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
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {}),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(_size.width * 0.025)),),
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
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                           Radius.circular(_size.width * 0.025)),
                     ),
                      prefixIcon: Icon(Icons.phone),

                      hintText: 'Phone',
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
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          print(
                              '$_acceptterms,usr:$_email,pass:$_password');
                          FocusScope.of(context)
                              .requestFocus(FocusNode());
                        }
                      },
                      title: 'Register',
                      width: _size.width * 0.8,
                      height: _size.height * 0.078,
                    ),
                  ],
                ),
              ],
            ),
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

  //Google Login
  Future<String> _testSignInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    print(' signInWithGoogle succeeded : ' + user.uid + " " + user.email + " " + user.displayName + " " + "  " + user.photoUrl + " " );
    return 'signInWithGoogle succeeded: $user';
  }

  Widget _getSignUPLabel(){
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
                Text('Already have an account?  '),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Login()));
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

