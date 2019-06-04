import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CurvedNavigationBar Demo'),
        ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemBuilder: (_, index) {
              return ListTile(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 1.0, color: Colors.white24))),
                    child: Icon(
                      Icons.autorenew,
                    ),
                  ),
                  title: Text(
                    "Introduction to Driving",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.linear_scale, color: Colors.green),
                      Text(" Intermediate")
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right, size: 30.0));
            },
            itemCount: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedNavigationBar(
              index: 0,
              items: [
                CurvedNavigationItem(
                    icon: Icon(Icons.add, size: 30), text: Text('Add')),
                CurvedNavigationItem(
                    icon: Icon(Icons.list, size: 30), text: Text('List')),
                CurvedNavigationItem(
                    icon: Icon(Icons.home, size: 30), text: Text('Home')),
                CurvedNavigationItem(
                    icon: Icon(Icons.call_split, size: 30),
                    text: Text('Split')),
                CurvedNavigationItem(
                    icon: Icon(Icons.perm_identity, size: 30),
                    text: Text('Profile')),
              ],
              shadow: 5.0,
              color: Colors.white,
              backgroundColor: Colors.transparent,
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
