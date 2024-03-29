library bottom_navy_bar;

import 'package:flutter/material.dart';

class BottomNavyBar extends StatefulWidget {
  final int currentIndex;
  final double iconSize;
  final Color backgroundColor;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;

  BottomNavyBar({
    Key key,
    this.currentIndex = 0,
    this.iconSize = 48,
    this.backgroundColor,
    @required this.items,
    @required this.onItemSelected
  }) {
    assert(items != null);
    assert(onItemSelected != null);
  }

  @override
  _BottomNavyBarState createState() {
    return _BottomNavyBarState(
        items: items,
        backgroundColor: backgroundColor,
        currentIndex: currentIndex,
        iconSize: iconSize,
        onItemSelected: onItemSelected
    );
  }
}


class _BottomNavyBarState extends State<BottomNavyBar> {
  final int currentIndex;
  final double iconSize;
  Color backgroundColor;
  List<BottomNavyBarItem> items;
  int _selectedIndex;
  ValueChanged<int> onItemSelected;

  _BottomNavyBarState({
    @required this.items,
    this.currentIndex,
    this.backgroundColor,
    this.iconSize,
    @required this.onItemSelected
  }) {
    _selectedIndex = currentIndex;

    assert(items.length > 1, 'Required more than one item');
  }

  Widget _buildItem(BottomNavyBarItem item, bool isSelected) {
    return AnimatedContainer(
      width: isSelected ? 135 : 75,
      height: double.maxFinite,
      duration: Duration(milliseconds: 450),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        color: isSelected ? item.activeColor.withOpacity(0.3) : backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconTheme(
                  data: IconThemeData(
                      size: iconSize,
                      color: isSelected ?
                      item.activeColor.withOpacity(1)
                          : item.inactiveColor == null ? item.activeColor : item.inactiveColor),
                  child: item.icon,
                ),
              ),
              isSelected
                  ? DefaultTextStyle.merge(
                style: TextStyle(color: item.activeColor, fontWeight: FontWeight.bold),
                child: item.title,
              ) : SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor = (backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : backgroundColor;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 86,
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 13.0,bottom: 13.0),
      decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          var index = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              onItemSelected(index);

              setState(() {
                _selectedIndex = index;
              });
            },
            child: _buildItem(item, _selectedIndex == index),
          );
        }).toList(),
      ),
    );
  }
}

class BottomNavyBarItem {
  final Icon icon;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;

  BottomNavyBarItem({
    @required this.icon,
    @required this.title,
    this.activeColor = Colors.blue,
    this.inactiveColor
  }){
    assert(icon != null);
    assert(title != null);
  }
}
