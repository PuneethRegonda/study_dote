import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_dote/flash_cards/flash_main.dart';

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
                    builder: (BuildContext context) => MyApp()));
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
             color: Colors.blue.withOpacity(0.06),
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
                       color: Color.fromRGBO(244, 245, 249, 1),
//                  child: ,
                     )),
                 ClipRRect(
                     borderRadius: BorderRadius.circular(10.0),
                     child: Container(
                       width: 110.0,
                       height: 80.0,
                       color: Color.fromRGBO(244, 245, 249, 1),
//                  child: ,
                     )),
                 ClipRRect(
                     borderRadius: BorderRadius.circular(10.0),
                     child: Container(
                       width: 110.0,
                       height: 80.0,
                       color: Color.fromRGBO(244, 245, 249, 1),
//                  child: ,
                     )),
               ],
             ),
           ),
            Container(
//              padding: EdgeInsets.symmetric(vertical: .0),
              height: 10.0,
              color: Colors.blue.withOpacity(0.2),
            ),
            new OverallScrore(),
            Container(
//              padding: EdgeInsets.symmetric(vertical: .0),
              height: 10.0,
              color: Colors.blue.withOpacity(0.2),
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
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Overall Score',style: TextStyle(
                fontSize: 23.0,
              ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: 80.0,
                            height: 55.0,
                            child: Center(child: Text('64',style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),)),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Attempts',),
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
                              child: Center(child: Text('64',style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),)),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Color.fromRGBO(96, 196, 146, 1),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('Correct',),
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
                              child: Center(child: Text('64',style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),)),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.red[300],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('Incorrect',),
                          )
                        ],
                      ),
                    ), Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              width: 80.0,
                              height: 55.0,
                              child: Center(child: Text('64',style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),)),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.amber.withOpacity(0.5),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('Percentage',),
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
                    Icon(Icons.warning,
                      size: 28.0,
                      color: Colors.red[300],),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Notice',style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.red,
                      ),),
                    ),
                  ],
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                IconButton(icon: Icon(Icons.remove_circle_outline),
                    onPressed: (){
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
               Wrap(
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text('NAMS Physiology is now live',
                         style: TextStyle(
                           fontSize: 18.0,
                         ),),
                     )]),
             ],
           ),
          ],
        ),
      ),
    );
  }
}


