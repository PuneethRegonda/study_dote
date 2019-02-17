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
              onTap: (){
              },
            ),
            ListTile(
              leading: Icon(Icons.card_membership),
              title: Text('Flash Cards'),
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => FlashCardMain()));
              },
            )
          ],
        ) ,
      ),
      body: Container(
        child: Center(child: Text('Study-dote',style: TextStyle(fontSize: 24.0),),),
      ),
    );
  }
}
