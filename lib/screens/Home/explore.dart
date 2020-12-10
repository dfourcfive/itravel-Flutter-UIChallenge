import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:itravel/screens/Home/explore/flights.dart';
import 'package:itravel/widgets/DestinationCarousel.dart';
import 'package:itravel/widgets/HotelCarousel.dart';

class explore extends StatefulWidget {
  explore({Key key}) : super(key: key);

  @override
  _exploreState createState() => _exploreState();
}

class _exploreState extends State<explore> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<Widget> _pageOption = [
    Column(
      children: [
        SizedBox(
          height: 20,
        ),
        DestinationCarousel(),
      ],
    ),
    Column(
      children: [
        SizedBox(
          height: 20,
        ),
        HotelCarousel()
      ],
    ),
    flights()
  ];
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.taxi
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).textTheme.bodyText1.color, width: 0.1),
          color: _selectedIndex == index
              ? Theme.of(context).backgroundColor
              : Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 120.0),
          child: Text(
            'What would you like to find?',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _icons
              .asMap()
              .entries
              .map(
                (MapEntry map) => _buildIcon(map.key),
              )
              .toList(),
        ),
        _pageOption[_selectedIndex],
      ],
    );
  }
}
