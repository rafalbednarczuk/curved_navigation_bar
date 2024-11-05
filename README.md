# curved_navigation_bar
[pub package](https://pub.dartlang.org/packages/curved_navigation_bar)

A Flutter package for easy implementation of curved navigation bar. 

![Gif](https://github.com/rafalbednarczuk/curved_navigation_bar/blob/master/example.gif "Fancy Gif")

### Add dependency

```yaml
dependencies:
  curved_navigation_bar: ^1.0.6 #latest version
```

### Easy to use

```dart
Scaffold(
  bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: Colors.blueAccent,
    items: <CurvedBarItem>[
      CurvedBarItem(child: Icon(Icons.add, size: 30)),
      CurvedBarItem(child: Icon(Icons.list, size: 30)),
      CurvedBarItem(child: Icon(Icons.compare_arrows, size: 30)),
    ],
    onTap: (index) {
      //Handle button tap
    },
  ),
  body: Container(color: Colors.blueAccent),
)
```

### Attributes

`items`: List of CurvedbBarItem(check below for the attributes)\
`index`: index of NavigationBar, can be used to change current index or to set initial index\
`color`: Color of NavigationBar, default Colors.white\
`buttonBackgroundColor`: background color of floating button, default same as color attribute\
`backgroundColor`: Color of NavigationBar's background, default Colors.blueAccent\
`onTap`: Function handling taps on items\
`animationCurve`: Curves interpolating button change animation, default Curves.easeOutCubic\
`animationDuration`: Duration of button change animation, default Duration(milliseconds: 600)\
`height`: Height of NavigationBar, min 0.0, max 75.0\
`maxWidth`: Allows to set the width of the navigation bar lower than the entire screen width by default\
`letIndexChange`: Function which takes page index as argument and returns bool. If function returns false then page is not changed on button tap. It returns true by default\
`activeLabelStyle`: Label Style for the active curved bar item. Optional\
`inActiveLabelStyle`: Label Style for the inactive curved bar item. Optional\
`showActiveLabel`: If true shows the label for active curved bar item, default false\
`showInactiveLabel`: If true shows the label for inactive curved bar item, default false\

#### CurvedBarItem Attribute

`child`: Widget for rendering curved bar item\
`label`: label of the bar curved bar item. Is Optional,


### Change page programmatically

```dart
 //State class
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          items: <CurvedBarItem>[
            CurvedBarItem(child: Icon(Icons.add, size: 30)),
            CurvedBarItem(child: Icon(Icons.list, size: 30)),
            CurvedBarItem(child: Icon(Icons.compare_arrows, size: 30)),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(_page.toString(), textScaleFactor: 10.0),
                ElevatedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    //Page change using state does the same as clicking index 1 navigation button
                    final CurvedNavigationBarState? navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState?.setPage(1);
                  },
                )
              ],
            ),
          ),
        ));
  }
```