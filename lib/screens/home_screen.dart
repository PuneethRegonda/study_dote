import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:study_dote/flash_cards/flash_card_select_topics.dart';
import 'package:study_dote/screens//user_profile_settings.dart';
import 'package:study_dote/scoped_model/scopedmodel.dart';
import 'package:study_dote/screens/dashboard_body.dart';
import 'package:study_dote/screens/why_us.dart';
import 'package:study_dote/screens/custom_app_bar.dart';

class Home extends StatelessWidget {

  TextStyle _listTileTextStyle = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return ScopedModel<FlipScoppedModel>(
      model: FlipScoppedModel(),
      child: Scaffold(
          key: Key('Drawerscafoldkey'),
          backgroundColor: Colors.red,
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                CustomeAppBar(
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  leading: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 30.0, height: 30.0),
                      child: Image.asset('assets/drawer_assets/menu.png')),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ListTile(
                  leading: ImageIcon(AssetImage('assets/drawer_assets/dashboard.png')),
                  title: Text(
                    'Dashboard',
                    style: _listTileTextStyle,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Divider(
                  height: 3.0,
                ),
                ListTile(
                  leading: ImageIcon(AssetImage('assets/drawer_assets/mock_exam.png')),
                  title: Text(
                    'Mock Exam',
                    style: _listTileTextStyle,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: ImageIcon(AssetImage('assets/drawer_assets/flash_card.png')),
                  title: Text(
                    'Flash Cards',
                    style: _listTileTextStyle,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) => LetsFlashCard()));
                  },
                ),
                ListTile(
                  leading: ImageIcon(AssetImage('assets/drawer_assets/tagged.png')),
                  title: Text(
                    'Bookmarked',
                    style: _listTileTextStyle,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: ImageIcon(AssetImage('assets/drawer_assets/blogs.png')),
                  title: Text(
                    'Blogs',
                    style: _listTileTextStyle,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: ImageIcon(AssetImage('assets/drawer_assets/invite.png')),
                  title: Text(
                    'Invite Friends',
                    style: _listTileTextStyle,
                  ),
                  onTap: () {
//                     Navigator.of(context).push(CupertinoPageRoute(
//                         builder: (BuildContext context) => FlashCardMain()));
                  },
                ),
                ListTile(
                  leading: ImageIcon(AssetImage('assets/drawer_assets/why_us.png')),
                  title: Text(
                    'Why Us',
                    style: _listTileTextStyle,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) => WhyUs()));
                  },
                ),
                ListTile(
                  leading: ImageIcon(AssetImage('assets/drawer_assets/contact.png')),
                  title: Text(
                    'Contact Us ',
                    style: _listTileTextStyle,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: ImageIcon(AssetImage('assets/drawer_assets/settings.png')),
                  title: Text(
                    'Settings',
                    style: _listTileTextStyle,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) => Setting()));

                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: getBottomNavBar(),
          body: CustomAppBar(
            title: 'Home',
            body: DashBoardBody(),
          )),
    );
  }
}

Widget getBottomNavBar() {
  return BottomNavigationBar(
    currentIndex: 0,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
          activeIcon: ImageIcon(
            AssetImage('assets/menu_icons/nav_bar_icons/home_white.png'),
            color: Colors.blue,
          ),
          icon: ImageIcon(
            AssetImage('assets/menu_icons/nav_bar_icons/home_white.png'),
            color: Colors.black,
          ),
          title: Text('Home', style: TextStyle(color: Colors.black87))),
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/menu_icons/nav_bar_icons/qbank.png'),
            color: Colors.black,
          ),
          title: Text('QBank', style: TextStyle(color: Colors.black87))),
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/menu_icons/nav_bar_icons/testseries.png'),
            color: Colors.black,
          ),
          title: Text('Test Series', style: TextStyle(color: Colors.black87))),
      BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/menu_icons/nav_bar_icons/statistics.png'),
            color: Colors.black,
          ),
          title: Text('Statistics', style: TextStyle(color: Colors.black87))),
    ],
  );
}
