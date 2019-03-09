import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_dote/flash_cards/flash_main.dart';

final Shader linearGradient = LinearGradient(
  colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

class DashBoardBody extends StatefulWidget {
  @override
  DashBoardBodyState createState() {
    return new DashBoardBodyState();
  }
}

class DashBoardBodyState extends State<DashBoardBody> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Column(
              children: <Widget>[
                new Noticeboard(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Card(
                      elevation: 0.0,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 0.0, bottom: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: (){},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    color: Color(0xFFF4F5F8),
                                    width: _width * 2.9 / 10,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 50.0,
                                            height: 35.0,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/menu_icons/dailycapsule.png'),
                                              fit: BoxFit.scaleDown,
                                            )),
                                          ),
                                        ),
                                        Wrap(children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5.0),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  'Daliy',
                                                  style: TextStyle(
                                                    letterSpacing: 0.7,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                                Text(
                                                  'Capsule ',
//                             textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    letterSpacing: 0.7,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ])
                                      ],
                                    ),
//                  child: ,
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: InkWell(
                                onTap: (){},
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      color: Color(0xFFF4F5F8),
                                      width: _width * 2.9 / 10,
//                     height: 82.0,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 35.0,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/menu_icons/flash.png'),
                                                fit: BoxFit.scaleDown,
                                              )),
                                            ),
                                          ),
                                          Wrap(children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    'Flash',
//                             textAlign: TextAlign,
                                                    style: TextStyle(
                                                      letterSpacing: 0.7,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Cards ',
//                             textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      letterSpacing: 0.7,
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ])
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            InkWell(
                              onTap: (){},
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    color: Color(0xFFF4F5F8),
                                    width: _width * 2.9 / 10,
//                     height: 82.0,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 50.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/menu_icons/subscribe.png'),
                                              fit: BoxFit.scaleDown,
                                            )),
                                          ),
                                        ),
                                        Wrap(children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5.0),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  'Subscribe',
//                             textAlign: TextAlign,
                                                  style: TextStyle(
                                                    letterSpacing: 0.7,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                                Text(
                                                  'Now',
//                             textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    letterSpacing: 0.7,
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ])
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child:  OverallScrore(_height,_width),
          ),

          ///Subjective Performance
          ///
          Container(
            color: Colors.white,
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

                ///button see all
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: GradientButton(
                        gradient: null,
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

          ///the Two cards that is Top Performers and disscusions
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(top: 10.0,right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(right: 5.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Top Performers',
                                style: TextStyle(
                                    fontSize: _width * 0.5 / 10,
                                    color: Colors.black
//                                   fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),

                            ///
                            /// here goes the top performers list in the
                            ///
                            ///
                            /// USING LIST VIEW BUILDER V arre getting error so try to get the
                            /// detials in to topPreformers list get
                            ///
                            /// 1 Image
                            /// 2 name
                            /// 3 Percentage
                            ///
                            ///
                            ///
                            ///

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  foregroundColor: Colors.blue,
                                  radius: 25.0,
                                ),
                                title: Text('Mani'),
                                trailing: Text('99.99%'),
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  foregroundColor: Colors.blue,
                                  radius: 25.0,
                                ),
                                title: Text('Mani'),
                                trailing: Text('99.99%'),
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  foregroundColor: Colors.blue,
                                  radius: 25.0,
                                ),
                                title: Text('Mani'),
                                trailing: Text('99.99%'),
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  foregroundColor: Colors.blue,
                                  radius: 25.0,
                                ),
                                title: Text('Mani'),
                                trailing: Text('99.99%'),
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  foregroundColor: Colors.blue,
                                  radius: 25.0,
                                ),
                                title: Text('Mani'),
                                trailing: Text('99.99%'),
                              ),
                            ),


                          ],
                        ),
                        width: _width * 9 / 10,
//                          height: _height * 4.8 / 10,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        child: Container(
                          color: Colors.blue,
                          width: _width * 7.8 / 10,
                          height: _height * 4.8 / 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

OverallScrore(double divheight , double divwidth){
  return  Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 5.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '  Overall Score',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        width: divwidth*2.2/10,
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
                          color: Color(0xFF5181CE),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        'Attempts',
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
                        width: divwidth*2.2/10,
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
                          color: Color(0xFF5FC491),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        'Correct',
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
                        width: divwidth*2.2/10,
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
                          color: Color(0xFFEB6B6B),
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
                        width: divwidth*2.2/10,
                        height: 55.0,
                        child: Center(
                            child: Text(
                          '64%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xFFFCA43A)),
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
//          )
        ],
      ),
    );
  }

class Noticeboard extends StatelessWidget {
  const Noticeboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 248, 204, 1),
          border: Border.all(
            color: Color.fromRGBO(254, 239, 135, 1),
            width: 3.0,
          ),
        ),
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
                        child: Wrap(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'NAMS Physiology is now live',
                              style: TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: 20.0,
                        maxHeight: 35.0,
                        minWidth: 20.0,
                        maxWidth: 35.0),
                    child: Image.asset('assets/menu_icons/close.png')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
