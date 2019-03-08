import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProgressDialog extends StatefulWidget {

  _ProgressDialogState ps = new _ProgressDialogState();

  void show(){
    ps.setState((){
      ps.opacity = 1.0;
    });
  }

  void hide(){
    ps.setState((){
      ps.opacity = 0.0;
    });
  }

  @override
  State<StatefulWidget> createState() {
    return ps;
  }
}

class _ProgressDialogState extends State<ProgressDialog> {
  bool _isShowing = false;

  double opacity = 0.0;

  String message = "Loading...";

  void setMessage(String mess) {
    this.message = mess;
  }

//  void show() {
////    _showDialog();
//    _isShowing = true;
//  }
//
//  bool isShowing() {
//    return _isShowing;
//  }
//
//  void hide() {
//    Navigator.pop(buildContext);
//    _isShowing = false;
//  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Stack(
        children: <Widget>[
          CupertinoAlertDialog(
            content: SizedBox(
              height: 45.0,
              child: Center(
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 5.0),
                    Image.asset(
                      'assets/loader.gif',
                      height: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        message,
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PDStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

class MessageBox {
  bool _isShowing = false;

  BuildContext buildContext;
  String message = " ",
      title = " ";

  MessageBox(this.buildContext, this.message, this.title);

  void show() {
    _showDialog();
  }

  Future _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('$title'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(buildContext);
              },
            )
          ],
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
          ),
        );
      },
    );
    return null;
  }
}
