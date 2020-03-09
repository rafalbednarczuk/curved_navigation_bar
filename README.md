# curved_navigation_bar
[pub package](https://pub.dartlang.org/packages/curved_navigation_bar)

A Flutter package for easy implementation of curved navigation bar. 

![Gif](https://github.com/rafalbednarczuk/curved_navigation_bar/blob/master/example.gif "Fancy Gif")

### Add dependency

```yaml
dependencies:
  curved_navigation_bar: ^0.3.2 #latest version
```

### Easy to use

```dart
Scaffold(
  bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: Colors.blueAccent,
    items: <Widget>[
      Icon(Icons.add, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.compare_arrows, size: 30),
    ],
    navGuard: (int index) {
      // Handle access to the tab
      // Return boolean or Future<bool> or Stream<bool>
    },
    onTap: (index) {
      //Handle button tap
    },
  ),
  body: Container(color: Colors.blueAccent),
)
```

### Attributes

items: List of Widgets  
index: index of NavigationBar, can be used to change current index or to set initial index  
color: Color of NavigationBar, default Colors.white  
buttonBackgroundColor: background color of floating button, default same as color attribute  
backgroundColor: Color of NavigationBar's background, default Colors.blueAccent  
onTap: Function handling taps on items  
navGuard: Function handling tap and checks the guared result  
animationCurve: Curves interpolating button change animation, default Curves.easeOutCubic  
animationDuration: Duration of button change animation, default Duration(milliseconds: 600)  
height: Height of NavigationBar, min 0.0, max 75.0  


### Change page programmatically

```dart
  //State class
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          navGuard: (int index) {
            return index != 2; // disallow access to 3rd tab
            // can return boolean or Future<bool> or Stream<bool>
          },
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
                RaisedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    //Page change using state does the same as clicking index 1 navigation button
                    final CurvedNavigationBarState navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState.setPage(1);
                  },
                ),
                RaisedButton(
                  child: Text('Go To Page of index 2'),
                  onPressed: () {
                    //Page change using state does the same as clicking index 2 navigation button
                    // But also will ignore guard check
                    final CurvedNavigationBarState navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState.setPage(2, ignoreGuard: true);
                  },
                )
              ],
            ),
          ),
        ));
  }
```
