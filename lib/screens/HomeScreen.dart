import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:itravel/screens/Home/explore.dart';
import 'package:itravel/screens/Home/favorite.dart';
import 'package:itravel/screens/Home/profile.dart';
import 'package:itravel/screens/Home/wallet.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final _pageOption = [
    wallet(),
    explore(),
    favorite(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.transparent,
        height: 60,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceIn,
        index: 1,
        items: [
          Icon(
            FontAwesomeIcons.wallet,
            size: 20,
            color: Theme.of(context).iconTheme.color,
          ),
          Icon(Icons.explore,
              size: 20, color: Theme.of(context).iconTheme.color),
          Icon(
            Icons.favorite,
            size: 25,
            color: Theme.of(context).iconTheme.color,
          ),
          Icon(
            Icons.person,
            size: 20,
            color: Theme.of(context).iconTheme.color,
          )
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pageOption[_page],
    );
  }
}
