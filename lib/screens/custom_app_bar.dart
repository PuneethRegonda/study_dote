import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:study_dote/flash_cards/flash_main.dart';

class CustomAppBar extends StatefulWidget {
CustomAppBar({
 @required this.body,
 @required this.title,
});

final Widget body;
final String title;

  @override
  CustomAppBarState createState() {
    return new CustomAppBarState();
  }
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    void handleDrawerButton() {
      print('scafold');
      Scaffold.of(context).openDrawer();
    }
     return MaterialApp(
         home: Scaffold(
      appBar: CustomeAppBar(
        title: Text(
          widget.title,style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),),
//        leading: Container(),
        leading: InkWell(
            onTap: handleDrawerButton,
            child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 30.0,height: 30.0),
                child: Image.asset('assets/drawer_assets/menu.png'))),
      ),
       body: widget.body,
    ));
  }
}

class CustomeAppBar extends StatefulWidget implements PreferredSizeWidget {

  CustomeAppBar({
    this.title,
    this.leading,
});
  final Widget leading;
  final Widget title;


  @override
  CustomeAppBarState createState() {
    return new CustomeAppBarState();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight*1.2);
}

class CustomeAppBarState extends State<CustomeAppBar> {

  @override
  Widget build(BuildContext context) {
    var divheight = MediaQuery.of(context).size.height;
    Widget title = widget.title;
    Widget leading = widget.leading;
    Widget appBar ;
    appBar = Align(
      alignment: Alignment.topCenter,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 7.0),
                child: leading,
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: title,
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xFF000000),
                blurRadius: 1.5,
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF3B9ECF),
                  Color(0xFF04C199),
                ])),
        height: divheight / 2 * 0.3,
      ),
    );
    return appBar;
  }

}

