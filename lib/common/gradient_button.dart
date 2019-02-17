import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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