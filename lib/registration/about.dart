import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  AboutState createState() {
    return new AboutState();
  }
}
final Shader linearGradient = LinearGradient(
  colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));


class AboutState extends State<About> {
  bool status=false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 8)).whenComplete((){
      setState(() {
        status=true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    Size _size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Center(
                child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
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
//                  foregroundColor: Colors.blue,
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                  status?
                  Container(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Regonda Puneeth',
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
                  ):
                  ListTileCustome(),
                  Divider(),
                  status?
                  Container(
                    height: 50.0,
                    child: ListTile(
                      leading: Icon(Icons.email),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Puneethregonda@gmail.com',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 17.0,
                          ),
                          )
                        ],
                      ),
                    ),
                  )
                      :ListTileCustome(),
                  Divider(),
                  status?
                  Container(
                    height: 50.0,
                    child: ListTile(
                      leading: Icon(Icons.phone),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '+91 94410 95948',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 17.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ):ListTileCustome(),
                  Divider(),
                  status?
                  Container(
                    height: 50.0,
                    child: ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('20-09-18',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 17.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ):ListTileCustome(),
                  Divider(),
                  status?
                  Container(
                    height: 60.0,
                    child: ListTile(
                      leading: Icon(Icons.person_pin_circle),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Male',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 17.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ):ListTileCustome(),
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
                  status?
                  Container(
                    child: ListTile(
                      leading: Icon(Icons.lock),
                      title: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '********',
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
                  ):ListTileCustome(),
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
                  status?
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
                  ):ListTileCustome(),
                  Divider(),
                  status?
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
                  ):ListTileCustome(),Divider(),
                  status?
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
                  ):ListTileCustome(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileCustome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Container(
         child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                child: Container(
                ),
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    height: 10.0,
                    color: Colors.blue[50].withOpacity(0.9),
                  ),
                  Container(
                    width: 180.0,
                    height: 10.0,
                    color: Colors.blue[50].withOpacity(0.7),
                  ),

                ],
              ),
            ],
          ),
          height: 30.0,
        ),
      ),
    );
  }
}
