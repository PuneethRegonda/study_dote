import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_dote/data_models/user_data.dart';
import 'package:study_dote/flash_cards/flash_card_select_topics.dart';
import 'package:study_dote/flash_cards/flash_main.dart';

final Shader linearGradient = LinearGradient(
  colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountEmail: Text('${UserData.email}'),
              accountName: Text('Mani'),
              currentAccountPicture: CircleAvatar(
                radius: 60.0,
                child: Image.asset('assets/person.png'),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.card_membership),
              title: Text('Flash Cards'),
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => LetsFlashCard()));
              },
            )
          ],
        ),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: new Noticeboard(),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        width: 110.0,
                        height: 80.0,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 50.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                      'assets/menu_icons/dailycapsule.png'),
                                  fit: BoxFit.scaleDown,
                                )),
                              ),
                            ),
                            Wrap(children: <Widget>[
                              Text(
                                'Daliy Capsule',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  letterSpacing: 0.7,
                                  fontSize: 15.0,
                                ),
                              )
                            ])
                          ],
                        ),
//                  child: ,
                      )),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        width: 110.0,
                        height: 80.0,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 50.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image:
                                      AssetImage('assets/menu_icons/flash.png'),
                                  fit: BoxFit.scaleDown,
                                )),
                              ),
                            ),
                            Wrap(children: <Widget>[
                              Text(
                                'Flash Cards',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  letterSpacing: 0.7,
                                  fontSize: 15.0,
                                ),
                              )
                            ])
                          ],
                        ),
                      )),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        width: 110.0,
                        height: 80.0,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 50.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                      'assets/menu_icons/dailycapsule.png'),
                                  fit: BoxFit.scaleDown,
                                )),
                              ),
                            ),
                            Wrap(children: <Widget>[
                              Text(
                                'Subcribe Now',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  letterSpacing: 0.7,
                                  fontSize: 15.0,
                                ),
                              )
                            ])
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: 10.0,
              color: Colors.blue.withOpacity(0.2),
            ),
            new OverallScrore(),
            Container(
//              padding: EdgeInsets.symmetric(vertical: .0),
              height: 10.0,
              color: Colors.blue.withOpacity(0.2),
            ),

            ///Subjective Performance
            ///
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Subjective Performance',
                      style: TextStyle(
                        fontSize: 20.0,
//                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.format_align_center),
                        onPressed: () {
                          print('chervol pressed ');
                        }),
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text('Anaesthesia'),
                          ),
                        ),
                        Container(
                          height: 10.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: new LinearGradient(
                              colors: [
                                Color.fromRGBO(57, 160, 205, 1),
                                Color.fromRGBO(5, 193, 154, 1)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text('Anaesthesia'),
                          ),
                        ),
                        Container(
                          height: 10.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: new LinearGradient(
                              colors: [
                                Color.fromRGBO(57, 160, 205, 1),
                                Color.fromRGBO(5, 193, 154, 1)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text('Anaesthesia'),
                          ),
                        ),
                        Container(
                          height: 10.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: new LinearGradient(
                              colors: [
                                Color.fromRGBO(57, 160, 205, 1),
                                Color.fromRGBO(5, 193, 154, 1)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: GradientButton(
                          onPressed: () {},
                          title: 'See All',
                          width: 150.0,
                          height: 50.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverallScrore extends StatelessWidget {
  const OverallScrore({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.7,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Overall Score',
                style: TextStyle(
                  fontSize: 23.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              width: 80.0,
                              height: 55.0,
                              child: Center(
                                  child: Text(
                                '64',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Attempts',
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              width: 80.0,
                              height: 55.0,
                              child: Center(
                                  child: Text(
                                '64',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color.fromRGBO(96, 196, 146, 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Correct',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              width: 80.0,
                              height: 55.0,
                              child: Center(
                                  child: Text(
                                '64',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.red[300],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Incorrect',
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              width: 80.0,
                              height: 55.0,
                              child: Center(
                                  child: Text(
                                '64',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.amber.withOpacity(0.5),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Percentage',
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Noticeboard extends StatelessWidget {
  const Noticeboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(254, 239, 135, 1),
          width: 3.0,
        ),
      ),
      child: Card(
        elevation: 0.0,
        color: Color.fromRGBO(255, 248, 204, 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 30.0,
                          height: 50.0,
                          child: Image.asset('assets/menu_icons/notice.png')),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Notice',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      print('need to remove the Notice ');
                    }),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   IconButton(icon: Icon(Icons.remove_circle_outline),
//                       onPressed: (){
//                         print('need to remove the Notice ');
//                       })
//                 ],
//               ),
              ],
            ),
            Divider(),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  width: 20.0,
                ),
                Wrap(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'NAMS Physiology is now live',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Container(
//child: ListView(
//scrollDirection: Axis.horizontal,
//children: <Widget>[
//Card(
//child: Column(
//children: <Widget>[
//ListTile(
//trailing: CircleAvatar(
//foregroundColor: Colors.blue,
//),
//title: Text('Poja Naiak'),
//)
//],
//) ,
//),
//Card(
//child: Column(
//children: <Widget>[
//ListTile(
//trailing: CircleAvatar(
//foregroundColor: Colors.blue,
//),
//title: Text('Poja Naiak'),
//)
//],
//) ,
//),              ],
//),
//)
