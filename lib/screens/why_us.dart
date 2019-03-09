import 'package:flutter/material.dart';
import 'package:study_dote/screens/custom_app_bar.dart';

final  TextStyle style=  TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0,color: Colors.black,);

class WhyUs extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              CustomeAppBar(
                title: Text(
                  'Home',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),),
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30.0,height: 30.0),
                    child: Image.asset('assets/drawer_assets/menu.png')),
              ),
//                SizedBox(
//                  height: 20.0,
//                ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                leading:ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30.0,height: 30.0),
                    child: Image.asset('assets/drawer_assets/dashboard.png')),
                title: Text('Dashboard',
                  style: TextStyle(
                      fontSize: 18.0
                  ),),
                onTap: () {},
              ),
              Divider(
                height: 3.0,
              ),
              ListTile(
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30.0,height: 30.0),
                    child: Image.asset('assets/drawer_assets/mock_exam.png')),
                title: Text('Mock Exam',
                  style: TextStyle(
                      fontSize: 18.0
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30.0,height: 30.0),
                    child: Image.asset('assets/drawer_assets/flash_card.png')),
                title: Text('Flash Cards',
                  style: TextStyle(
                      fontSize: 18.0
                  ),),
                onTap: () {},
              ),
              ListTile(
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30.0,height: 30.0),
                    child: Image.asset('assets/drawer_assets/tagged.png')),
                title: Text('Bookmarked',
                  style: TextStyle(
                      fontSize: 18.0
                  ),),
                onTap: () {},
              ),
              ListTile(
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30.0,height: 30.0),
                    child: Image.asset('assets/drawer_assets/blogs.png')),
                title: Text('Blogs',
                  style: TextStyle(
                      fontSize: 18.0
                  ),),
                onTap: () {},
              ),
              ListTile(
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30.0,height: 30.0),
                    child: Image.asset('assets/drawer_assets/invite.png')),
                title: Text('Invite Friends',
                  style: TextStyle(
                      fontSize: 18.0
                  ),),
                onTap: () {
//                     Navigator.of(context).push(CupertinoPageRoute(
//                         builder: (BuildContext context) => FlashCardMain()));
                },
              ),
              ListTile(
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30.0,height: 30.0),
                    child: Image.asset('assets/drawer_assets/why_us.png')),
                title: Text('Why Us',
                  style: TextStyle(
                      fontSize: 18.0
                  ),),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30.0,height: 30.0),
                    child: Image.asset('assets/drawer_assets/contact.png')),
                title: Text('Contact Us ',
                  style: TextStyle(
                      fontSize: 18.0
                  ),),
                onTap: () {},
              ),
              ListTile(
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 30.0,height: 30.0),
                    child: Image.asset('assets/drawer_assets/settings.png')),
                title: Text('Settings',
                  style: TextStyle(
                      fontSize: 18.0
                  ),),
                onTap: () {},
              ),
            ],
          ),
        ),


        body: CustomAppBar(


          title: 'Why Us',


          body: WhyUsBody(),));
  }
}



class WhyUsBody extends StatelessWidget {
// final BuildContext drawercontext;

  const WhyUsBody({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(


     body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ///
          /// 1. Card with verbatim about studydote
          ///

          Container(
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                      title: Text(
                        "Lorem ipsum dolor sit amet",
                        style: style,
                      )),
                  ListTile(
                      title: Wrap(
                        runAlignment: WrapAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0, top: 10.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. ',
                              style: TextStyle(
                                letterSpacing: 0.7,
                                wordSpacing: 0.5,
                                textBaseline: TextBaseline.ideographic,
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
          ///
          ///
          ///
          ///
          ///
          ///
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
//              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text(
                    "  Lorem ipsum dolor sit amet",
                    style: style,
                  ),
                ),
                twoCards(size),
                ///
                ///
                /// 2. cards
                ///
                ///
                ///
                Card(child: Container(color: Colors.white, margin: EdgeInsets.only(top: 15.0),
                  child: Column(children: <Widget>[
                    ListTile(
                      title: Text("What you can get with Studydote ", style: style,),
                    ),
                    diagnostic(size),
                    enrichedContents(size),
                    practiceandMockTest(size)]),),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget  enrichedContents(Size size) {

    return  Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFFF4F5F8),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
      ),

      child: Center(
        child: Column(
          children: <Widget>[
            ListTile(title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Enriched Contents',
                textAlign: TextAlign.justify,
                style: style,),
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(title: Wrap(
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.center,
                  children: <Widget>[Text(
                    'Expertise in top quality high yield contents rather than just extensive study materials.',
                    style: TextStyle(
                      wordSpacing: 0.1,
                      letterSpacing: 0.2,
                    ),
                    softWrap:true,
                    textAlign: TextAlign.justify,
                  )]),
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tight(size / 14),
                    child: Image.asset('assets/why_us/tick.png')),),
            ),
//             SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(title: Wrap(
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.center,
                  children: <Widget>[
                    Text(' Contents are sourced from top experts and market leaders in the field',
                      style: TextStyle(
                        wordSpacing: 0.3,
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.left,
                      softWrap:true,
                    )]),
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tight(size / 14),
                    child: Image.asset('assets/why_us/tick.png')),),
            )

          ],
        ),
      ),

    );

  }

  Widget twoCards(Size size) {
    return  Row(
      children: <Widget>[
        ConstrainedBox(
            constraints: BoxConstraints.tightFor(
                height: 300.0, width: size.width / 2),
            child: Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Wrap(
                      runAlignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Center(
                          child: ConstrainedBox(
                              constraints:
                              BoxConstraints.tight(size / 5),
                              child: Image.asset(
                                  'assets/why_us/gropu_book.png')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            'Despite all these hard work and dedication, never having a clue or idea about where we stand amongst aspirants?',
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.width*0.4/10,
                            ),),
                        ),
                      ],
                    ),
                  ],
                ),
                color: Colors.white,
              ),
            )),
        ConstrainedBox(
            constraints: BoxConstraints.tightFor(
                height: 300.0, width: size.width / 2),
            child: Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Wrap(
                      runAlignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Center(
                          child: ConstrainedBox(
                              constraints: BoxConstraints.tight(size / 5),
                              child: Image.asset(
                                  'assets/why_us/group_setting.png')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            'Still struggling to assemble notes and slide shares,gathering past questions and highlighting high yield questions?',
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.width*0.4/10,
                            ),),
                        ),

                      ],
                    ),
                  ],
                ),
                color: Colors.white,
              ),
            ))
      ],
    );
  }

  Widget practiceandMockTest(Size size) {

    return    Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFFF4F5F8),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
      ),

      child: Center(
        child: Column(
          children: <Widget>[
            ListTile(title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Practice and Mock Test',
                textAlign: TextAlign.justify,
                style: style,),
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(title: Wrap(
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.center,
                  children: <Widget>[Text(
                    'Reduces test anxiety and help overcome exam fear by pumping adequate confidence through increasing accuracy in your performance.',
                    style: TextStyle(
                      wordSpacing: 0.2,
                      letterSpacing: 0.2,

                    ),
                    softWrap:true,
                    textAlign: TextAlign.justify,
                  )]),
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tight(size / 14),
                    child: Image.asset('assets/why_us/tick.png')),),
            ),
//             SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(title: Wrap(
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.center,
                  children: <Widget>[
                    Text('Practicing MOCK exams and pacing yourself in the real exam like scenario makes you more confident and increases your accuracy.',
                      style: TextStyle(
                        wordSpacing: 0.2,
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.justify,
                      softWrap:true,
                    )]),
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tight(size / 14),
                    child: Image.asset('assets/why_us/tick.png')),),
            )

          ],
        ),
      ),

    );
  }

  Widget diagnostic(Size size) {
    return Container(margin: EdgeInsets.all(10.0), decoration: BoxDecoration(color: Color(0xFFF4F5F8), shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(10.0),),

      child: Center(
        child: Column(
          children: <Widget>[
            ListTile(title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Diagnostics',
                textAlign: TextAlign.justify,
                style: style,),
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(title: Wrap(
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.center,
                  children: <Widget>[Text(
                    'Helps easily access own performance through smart diagnostic and identify weakness to work on it.',
                    style: TextStyle(wordSpacing: 0.2,letterSpacing: 0.2,),
                    softWrap:true,
                    textAlign: TextAlign.justify,
                  )]),
                leading: ConstrainedBox(constraints: BoxConstraints.tight(size / 14),
                    child: Image.asset('assets/why_us/tick.png')),),
            ),
//             SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(title: Wrap(
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.center,
                  children: <Widget>[
                    Text(

                      'Provide insights about the performance and allow making decisions aimed to impact future learning processes',
                      style: TextStyle(textBaseline: TextBaseline.alphabetic,
                        wordSpacing: 0.2,letterSpacing: 0.2,),
                      softWrap:true,
                      textAlign: TextAlign.start,
                    )]),
                leading: ConstrainedBox(
                    constraints: BoxConstraints.tight(size / 14),
                    child: Image.asset('assets/why_us/tick.png')),),
            )

          ],
        ),
      ),

    );
  }
}
