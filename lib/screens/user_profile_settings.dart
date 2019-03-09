import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:study_dote/common/gradient_button.dart';


class Setting extends StatefulWidget {
  @override
  SettingState createState() {
    return new SettingState();
  }
}

class SettingState extends State<Setting> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordConfirmTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _height, _width;

  final Map<String, dynamic> _formData = {
    'fullname': null,
    'gender': null,
    'dob': null,
    'phonenumber': null,
    'newpassword': null,
    'educationstatus': null,
    'course': null,
    'institute': null,
  };

  final Map<String, String> _assets = {
    'calender':     'assets/user_prof_settings/calender.png',
    'course':       'assets/user_prof_settings/course.png',
    'email':        'assets/user_prof_settings/email.png',
    'fullname':     'assets/user_prof_settings/fullname.png',
    'institute':    'assets/user_prof_settings/institute.png',
    'password':     'assets/user_prof_settings/password.png',
    'ph_no':        'assets/user_prof_settings/ph_no.png',
    'placeholder':  'assets/user_prof_settings/placeholder.png',
  };

  BoxConstraints _constraints =
      BoxConstraints.tightFor(width: 30.0, height: 30.0);

    int _radioValue = 0;

   void _handleRadioValueChange(int value) {
     setState(() {
       _radioValue = value;

      switch (_radioValue) {
        case 0:
          _formData['gender']= 'Male';
          print(_formData['gender'].toString());
          break;
        case 1:
          _formData['gender']= 'Female';
          print(_formData['gender'].toString());
          break;
        case 2:
          _formData['gender']= 'Other';
          print(_formData['gender'].toString());

          break;
      }
    });
  }



  DateTime dob =DateTime.now();

  _showDateTimePicker() async {

    dob = await showDatePicker(
//      initialDatePickerMode,
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
    );


    setState(() {
      print(dob);
    });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      bottomNavigationBar:  _bottomNavBar() ,
    );
  }

  Widget _getAppBar() {
    return AppBar(
      title: Text('Profile'),
      centerTitle: true,
    );
  }

  Widget _getProfilePicSection() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 150.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70.0,
                child: Image.asset(
                  _assets['placeholder'],
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBasicInfoSection() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 15.0,
              ),
              Text(
                'Basic Information',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  textBaseline: TextBaseline.ideographic,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          Divider(),
          ListTile(
            leading: Image.asset(
              _assets['fullname'],
              fit: BoxFit.scaleDown,
            ),
            title: TextFormField(
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Full Name is Empty';
                }
              },
              onSaved: (String value) {
                setState(() {
                  _formData['fullname'] = value;
                });
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Fullname',
                labelText: 'Fullname',
              ),
            ),
          ),
//          Divider(),
          SizedBox(
            height: 10.0,
          ),
          ListTile(
            leading: ConstrainedBox(
              constraints: _constraints,
              child: Image.asset(
                _assets['email'],
                fit: BoxFit.scaleDown,
              ),
            ),
            title: TextFormField(
              validator: (String value) {
                if (!value.contains('@')) {
                  return 'Invalid email';
                }
              },
              onSaved: (String value) {
                setState(() {
                  _formData['fullname'] = value;
                });
              },
              enabled: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'you@email.com',
              ),
            ),
          ),

//          Divider(),
          ListTile(
            leading: ConstrainedBox(
              constraints: _constraints,
              child: Image.asset(
                _assets['ph_no'],
                fit: BoxFit.scaleDown,
              ),
            ),
            title: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                hintText: 'Phone Number',
                labelText: 'Phone Number',
              ),
              validator: (String value) {
                if (value.isEmpty || value.length != 10) {
                  return 'Invalid phone number';
                }
              },
              onSaved: (String value) {
                setState(() {
                  _formData['phonenumber'] = value;
                });
              },
            ),
          ),

//          Divider(),
          ListTile(
            onTap: _showDateTimePicker,
            trailing: Icon(Icons.keyboard_arrow_down),
            leading: ConstrainedBox(
              constraints: _constraints,
              child: Image.asset(
                _assets['calender'],
                fit: BoxFit.scaleDown,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('${dob.day}-'+'${dob.month}-'+'${dob.year}',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 17.0,
                  ),
                )
              ],
            ),
          ),

          ListTile(
            leading: SizedBox(
              width: 5.0,
            ),
            title: Column(
              children: <Widget>[
               Row(
                 mainAxisSize:MainAxisSize.max,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                   Text('Gender'),
                 ],

               ),
               _getGender(),
              ],
            ),
          ),
          Container(
            height: 20.0,
            color: Colors.blue[50].withOpacity(0.7),
//                    color: Colors.blueGrey[100].withOpacity(0.7),
          ),
        ],
      ),
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getProfilePicSection(),

             Container(
              height: 20.0,
              color: Colors.blue[50].withOpacity(0.7),
            ),

            _getBasicInfoSection(),

            _getpasswordSection(),

            _getAcademicInfo(),
          ],
        ),
      ),
    );
  }
  _getGender() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Radio(
          value: 0,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
        ),
        new Text('Male'),
        new Radio(
          value: 1,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
        ),
        new Text('Female'),
        new Radio(
          value: 2,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
        ),
        new Text('Other'),
      ],
    );
  }
   _getAcademicInfo() {
       return Container(
            color: Colors.white,
            child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      'Academic Info',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w700,
                        textBaseline: TextBaseline.ideographic,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Container(
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints: _constraints,
                      child: Image.asset(
                        _assets['password'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    title: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Education Status',
                            style: TextStyle(
                              fontSize: 17.0,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                      height: 40.0,
                    ),
                  ),
                ),
                Divider(),
                Container(
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints: _constraints,
                      child: Image.asset(
                        _assets['institute'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    title: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Institution Name ',
                            style: TextStyle(
                              fontSize: 17.0,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                      height: 40.0,
                    ),
                  ),
                ),
                Divider(),
                Container(
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints: _constraints,
                      child: Image.asset(
                        _assets['course'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    title: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Select Course',
                            style: TextStyle(
                              fontSize: 17.0,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ],
                      ),
                      height: 40.0,
                    ),
                  ),
                ),
              ],
            ),
          );
  }

     _getpasswordSection() {
    return Container(
            color: Colors.white,
            child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w700,
                        textBaseline: TextBaseline.ideographic,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                Divider(),
                ListTile(
                  leading: ConstrainedBox(constraints: _constraints,
                    child: Image.asset(_assets['password'], fit: BoxFit.scaleDown,),),
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Old Password',
                    ),
                    obscureText: true,
                    controller: _passwordConfirmTextController,
                    validator: (String value) {
                      ///only the [_formkey] validated and then make the hhtprequest and check the password
                      if (!_formKey.currentState.validate()) {
                        return 'Password Confirmation Failed';
                      } else {
                        _formKey.currentState.save();
                      }
                    },
//                      onSaved: (String value) {
//                        _formData['password'] = value;
//                      },
                  ),
                ),
//                  Divider(),
                ListTile(
                  leading: ConstrainedBox(
                    constraints: _constraints,
                    child: Image.asset(
                      _assets['password'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    controller: _passwordTextController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Password is Empty!!';
                      } else if (value.length < 6) {
                        return 'The password must be at least 6 characters';
                      }
                    },
//                      onSaved: (String value) {
//                        _formData['password'] = value;
//                      },
                  ),
                ),
//                  Divider(),
                ListTile(
                  leading: ConstrainedBox(
                    constraints: _constraints,
                    child: Image.asset(
                      _assets['password'],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    obscureText: true,
                    validator: (String value) {
                      if (_passwordTextController.text != value) {
                        return 'Passwords do not match.';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 20.0,
                  color: Colors.blue[50].withOpacity(0.7),
//                    color: Colors.blueGrey[100].withOpacity(0.7),
                ),
              ],
            ),
          );
  }

  Widget _bottomNavBar(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GradientButton(
        height: 50.0,
        onPressed: (){},
        title: 'Save',
        width: _width*9/10,
      ),
    );
  }


}
