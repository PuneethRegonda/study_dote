import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class Setting extends StatefulWidget {
  @override
  SettingState createState() {
    return new SettingState();
  }
}

class SettingState extends State<Setting> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordConfirmTextController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _genders = <String>['', 'Male', 'Female', 'others'];
  String _gender = '';

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

  DateTime selected;

  _showDateTimePicker() async {
    selected = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
    );
    setState(() {
      print(selected);
//      _formData['dob']=selected;
    });
  }

//  String _fullname;
//  String _email;
//  String _password;
//  String _phonenumber;

  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      CircleAvatar(
                        radius: 60.0,
                        foregroundColor: Colors.blue,
                        child: CircleAvatar(
                          radius: 55.0,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 20.0,
                color: Colors.blue[50].withOpacity(0.7),
              ),
              Container(
                color: Colors.white,
                child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 30.0,
                        ),
                        Text(
                          'Basic Information',
                          style: TextStyle(
                            fontSize: 17.0,
                            textBaseline: TextBaseline.ideographic,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Container(
                      width: width*9/10,
                      child: TextFormField(
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
                    Divider(),
                    Container(
                      height: height*0.8/10,
                      child: ListTile(
                        leading: Icon(Icons.email),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Puneethregonda@gmail.com',
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 17.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 50.0,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          prefixIcon: Icon(Icons.phone),
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
                    Divider(),
                    Container(
                      height: 50.0,
                      child: ListTile(
                        onTap: _showDateTimePicker,
                        leading: Icon(Icons.calendar_today),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '20-09-18',
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 17.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    new FormField(
                      builder: (FormFieldState state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            icon: const Icon(Icons.color_lens),
                            labelText: 'Color',
                          ),
                          isEmpty: _gender == '',
                          child: new DropdownButton(
                            value: _gender,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                _gender = newValue;
                                print('$newValue');
                                state.didChange(newValue);
                              });
                            },
                            items: _genders.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                    Container(
                      height: 20.0,
                      color: Colors.blue[50].withOpacity(0.7),
//                    color: Colors.blueGrey[100].withOpacity(0.7),
                    ),
                  ],
                ),
              ),

              ///
              ///
              /// change PassWord
              ///
              Container(
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
                            textBaseline: TextBaseline.ideographic,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    TextFormField(
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
                    Divider(),
                    TextFormField(
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
                    Divider(),
                    Container(
                      child: TextFormField(
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
                    Container(
                      height: 20.0,
                      color: Colors.blue[50].withOpacity(0.7),
//                    color: Colors.blueGrey[100].withOpacity(0.7),
                    ),
                  ],
                ),
              ),

              ///
              ///
              /// Academic Info
              ///
              ///
              Container(
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
                            textBaseline: TextBaseline.ideographic,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.grade),
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
                        leading: Icon(Icons.school),
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
                        leading: Icon(Icons.golf_course),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
//Widget _buildPasswordTextField() {
//  return TextFormField(
//    decoration: InputDecoration(
//        labelText: 'Password', filled: true, fillColor: Colors.white),
//    obscureText: true,
//    controller: _passwordTextController,
//    validator: (String value) {
//      if (value.isEmpty || value.length < 6) {
//        return 'Password invalid';
//      }
//    },
//    onSaved: (String value) {
//      _formData['password'] = value;
//    },
//  );
//}
//
//Widget _buildPasswordConfirmTextField() {
//  return TextFormField(
//    decoration: InputDecoration(
//        labelText: 'Confirm Password', filled: true, fillColor: Colors.white),
//    obscureText: true,
//    validator: (String value) {
//      if (_passwordTextController.text != value) {
//        return 'Passwords do not match.';
//      }
//    },
//  );
//}
//
//
