import 'package:flutter/material.dart';
import 'swipe_feed_page.dart';
import 'dart:math';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp
    (
      title: 'Tinder cards demo',
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: ()=>Navigator.of(context).pop()),
          title: Text('Flash Card'),
          centerTitle: true,
        ),
        body:FalshCard(),
      )
    );
  }
}



class FalshCard extends StatefulWidget {
  @override
  _FalshCardState createState() => _FalshCardState();
}
//we have two  parts in flash card i.e when not flipped(Topic, Qustion, FlipButton)
//and  flipped  (Answer, FlipButton, Navigation Button)


String Question ='Answer to the questionbnbbbbb23456789';
int len=Question.length;

class _FalshCardState extends State<FalshCard> {


  Widget  _buildCardStack(double width,double height){
    return Center (
      //  BorderRadius.circular(10.0),
      child: FractionallySizedBox(
        heightFactor: 0.75,
        widthFactor: 0.7,
        child:  Stack(
          alignment: Alignment.topCenter,
          children: [
            //flip card button part,
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: width*7.5/10,
                height: height*6.0/10,
                child: FractionallySizedBox(
                    heightFactor: 0.98,
                    widthFactor: 0.98,
                    // alignment: Alignment.,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      // borderradius:,
                      child: Container(
                        color: Colors.white,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 40.0),
                                          alignment: Alignment.topCenter,
                                          color: Colors.white,
                                          child: Text('Topic',style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                          ),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5.0),
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          child:  Text(
                                            Question,
                                            maxLines: 1,
                                            overflow: TextOverflow.clip,
                                          ),

                                        ),
                                      ],
                                    )
                                ),
                                RaisedButton(
                                  child: Text('Flipcard'),
                                  onPressed: (){
                                    print(len);

                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                      colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],

                    )
                ),
              ),
              //when flipped the card need to be having navigation part ..
              //  Positioned(
              //    bottom: 0.0,
              //    right: 0.0,
              //    left: 0.0,
              //    child: FractionallySizedBox(
              //     widthFactor: 0.6,
              //      child: RaisedButton(
              //      color: Colors.blueAccent,
              //      child: Text('Flip Card'),
              //      onPressed: (){
              //        print('to Start the animation');
              //      },
              //    ),
              //    )
              //  ),,
            )
          ],
        ),
      ),

    );

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height =MediaQuery.of(context).size.height;
    final double width =MediaQuery.of(context).size.width;
   return FlipCard(
     direction: FlipDirection.HORIZONTAL,
     front: SwipeFeedPage(),
     back:  SafeArea(
       right: true,
       bottom: true,
       top: true,
       left: true,
       child: Stack(
         children: <Widget>[
           GestureDetector(
             onTap: (){
               return FocusScope.of(context).requestFocus(FocusNode());
             },
             child: Center(
               child: Text("Hello This will  be the card  answer"),
             ),
           ),

         ],
       ),
     ),
   );

  }
}


enum FlipDirection {
  VERTICAL,
  HORIZONTAL,
}

class AnimationCard extends StatelessWidget {
  AnimationCard({this.child, this.animation, this.direction});

  final Widget child;
  final Animation<double> animation;
  final FlipDirection direction;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        var transform = Matrix4.identity();
        transform.setEntry(3, 2, 0.001);
        if (direction == FlipDirection.VERTICAL) {
          transform.rotateX(animation.value);
        } else {
          transform.rotateY(animation.value);
        }
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: child,
    );
  }
}
//enum SlideDirection{
//  Right,
//  Left,
//}

class FlipCard extends StatefulWidget {
  final Widget front;
  final Widget back;
  final int speed = 500;
  final FlipDirection direction;

  const FlipCard(
      {Key key,
        @required this.front,
        @required this.back,
        this.direction = FlipDirection.HORIZONTAL})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FlipCardState();
  }
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> _frontRotation;
  Animation<double> _backRotation;

  bool isFront = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: widget.speed), vsync: this);
    _frontRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: pi / 2)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
    _backRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: -pi / 2, end: 0.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
  }

  _toggleCard() {
    if (isFront) {
      controller.forward();
    } else {
      controller.reverse();
    }
    isFront = !isFront;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[

        AnimationCard(
          animation: _backRotation,
          child: widget.back,
          direction: widget.direction,
        ),
        AnimationCard(
          animation: _frontRotation,
          child: widget.front,
          direction: widget.direction,
        ),
        Positioned(
          bottom: 10.0,
          right: 0.0,
          left: 0.0,
          child: _buildBottomBar(_toggleCard),
        ),
      ],
    );
  }
  Widget _buildBottomBar(Function togglecard) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      child: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // new RoundIconButton.small(
              //   icon: Icons.refresh,
              //   iconColor: Colors.orange,
              //   onPressed: () {
              //   return togglecard();
              //   },
              // ),
              // new RoundIconButton.large(
              //   icon: Icons.clear,
              //   iconColor: Colors.red,
              //   onPressed: () {
              //   },
              // ),
              GradientButton(
                onPressed: () {
                  return togglecard();
                  },

                title: 'FlipCard',
                width: _size.width * 0.8,
                height: _size.height * 0.078,
              ),
//              new RoundIconButton.small(
//                icon: Icons.star,
//                iconColor: Colors.blue,
//                onPressed: () {
//                  return togglecard();
//                },
//              ),
              // new RoundIconButton.large(
              //   icon: Icons.favorite,
              //   iconColor: Colors.green,
              //   onPressed: () {

              //   },
              // ),
              // new RoundIconButton.small(
              //   icon: Icons.lock,
              //   iconColor: Colors.purple,
              //   onPressed: () {
              //     // TODO:
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}





class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;

  RoundIconButton.large({
    this.icon,
    this.iconColor,
    this.onPressed,
  }) : size = 60.0;

  RoundIconButton.small({
    this.icon,
    this.iconColor,
    this.onPressed,
  }) : size = 50.0;

  RoundIconButton({
    this.icon,
    this.iconColor,
    this.size,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: const Color(0x11000000),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: new RawMaterialButton(
        shape: new CircleBorder(),
        elevation: 0.0,
        child: new Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}



class GradientButton extends StatelessWidget {
  const GradientButton(
      {Key key,
        @required this.onPressed,
        @required this.title,
        @required this.width,
        @required this.height})
      : super(key: key);

  final Function onPressed;
  final String title;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: Colors.lightBlue.withOpacity(0.5),
      onPressed: onPressed,
      child: Container(
        child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            )),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          shape: BoxShape.rectangle,
          gradient: new LinearGradient(
            colors: [
              Color.fromRGBO(57, 160, 205, 1),
              Color.fromRGBO(5, 193, 154, 1)
            ],
          ),
        ),
      ),
    );
  }
}
